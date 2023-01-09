@description('Location of the Resources')
param location string

param vmSubnetNetwork string

param vmPrivateIP string

param vmName string

param vmSize string

param adminUsername string

@secure()
param adminPassword string

@minValue(130)
param vmDiskSize int

resource VmPublicIP 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: 'VmPublicIP'
  location: location
  sku: {
    name: 'Basic'
  }
  properties:{
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource VmSecurityGroup 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: 'VmSecurityGroup'
  location: location
  properties:{
    securityRules:[
      {
        name: 'default-allow-3389'
        properties: {
          priority: 1000
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '3389'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }

}

resource VmVirtualNetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: 'VmVirtualNetwork'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vmSubnetNetwork
      ]
    }
    subnets: [
      {
        name: 'VmSubnet'
        properties: {
          addressPrefix: vmSubnetNetwork
          networkSecurityGroup: {
            id: VmSecurityGroup.id
          }
        }

      }
    ]

  }
}

resource VmNetworkInterface 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: 'VmNetworkInterface'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'NetworkInterface1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: vmPrivateIP
          publicIPAddress: {
            id: VmPublicIP.id
          }
          subnet: {
            id: VmVirtualNetwork.properties.subnets[0].id
          }
        }
      }
    ]
  }
}

resource Vm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile:{
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminPassword: adminPassword
      adminUsername: adminUsername
      windowsConfiguration:{
        enableAutomaticUpdates: false
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsDesktop'
        offer: 'Windows-11'
        sku: 'win11-21h2-pron'
        version: 'latest'
      }

      osDisk: {
        createOption:'FromImage'
        managedDisk: {
          storageAccountType:'StandardSSD_LRS'
        }
        diskSizeGB: vmDiskSize
      }
    }

    networkProfile: {
      networkInterfaces:[
        {
          id: VmNetworkInterface.id
        }
      ]
    }
  }
}
