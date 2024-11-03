## Dotfiles

My dotfiles for configuration of tools. Managed by [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html). The directory structure here will be mirrored into your $HOME directory.

## Setup

1. Clone this repo into your $HOME dir.
2. Run `stow . -t $HOME` to symlink files and directories here to $HOME. Note that this will not overwrite existing paths, so you may want to delete (/backup). 


## Ongoing Developement

Once you have this configuration symlinked you can use the command `stow-dotfiles` from the root of this directory to stow new configuration into $HOME. 
