# bicep-vm

## github
mit markus angeschaut wie ein github repository erstellen

## template suchen
https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.compute/vm-simple-windows/

## tutorial
https://www.youtube.com/watch?v=_yvb6NVx61Y

ctrl + space to show possible options of a ressource while defining it inside bicep

${} can be used to use variables in values
you can also reference resources by their allias
p.e. the name property of "resource storageaccountga" can be referenced as ${storageaccountga.name}

you can put 'what-if' instead of 'create' in the az deployment command to see what the output would be given you execute it

## bicep tutorial
https://learn.microsoft.com/de-de/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI
according files in Folder with same name
deployment ist possible via direct azcli commands(deploy.azcli) or right click on the file


## bicep vm
created newly with inspiration from  vm-simple-windows template

debug

## markdown syntax
https://www.markdownguide.org/basic-syntax/