# bicep-vm

The goal of this project is to create a bicep file that creates a normal windows vm. I want to build this script from scratch, to make sure only the necessary parts are included. Also this will result in better learnings for me.

## github

In a first step i created this github repository.

Before cloning the created repository i changed my git e-mail and username to the ones i use on github. (see command in **./commands.azcli** under **git**)

## template

I downloaded a existing directory with a [windows-vm-bicep-script](https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.compute/vm-simple-windows/) for inspiration. There i was able to see roughly what elements i needed, to build my own bicep-script.


## bicep introduction

At this point i wanted to learn some bicep. For that i watched a [bicep introduction video](https://www.youtube.com/watch?v=_yvb6NVx61Y) by John Savill.

Here i will list some of the usefull tips shown in the video:

- `ctrl + space` can be used to show possible options of a ressource while defining it inside bicep.

- `${}` can be used to reference variables inside values.
You can also reference resources by their allias.
Per example the name of `resource storageaccountga` can be referenced as `${storageaccountga.name}`

- You can put `what-if` instead of `create` in the az deployment command, to see what the output would be if you created it. (see **./deploy.azcli** for an example deploy command)

## bicep tutorial

To start of i did the [Microsoft bicep tutorial](https://learn.microsoft.com/de-de/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI). Additionaly i used the azcli commands to deploy it to azure using a parameter file.
The according files are stored in the folder **./bicep-tutorial/**.

The project files can be found under **./bicep-vm/**.

## bicep vm

At this point i felt ready to start with the actual bicep-vm script. I wrote it from scratch with some inspiration from the bicep-tutorial and the bicep-template i mentioned earlier.

After a lot of debuging and trial and error, it finally deployed. I tested it and it ran as expected. 🥳

## markdown syntax

To write this **README** i had to look up the syntax in the [markdown syntax sheet](https://www.markdownguide.org/basic-syntax/).
