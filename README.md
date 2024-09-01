# My Dotfiles
Welcome to my dotfiles repository! This repository contains my personal configuration files for various tools and applications. Feel free to explore, fork, and use them as you like.

## Installation
To get started with my dotfiles, you can clone this repository to your home directory and use GNU Stow to manage the symlinks.

```bash 
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

## Structure
Here’s a brief overview of the structure of this repository:

zsh/: Contains .zsh and other zsh configuration files
nvim/: Contains my neovim and other Vim configuration files
tmux/: Contains .tmux.conf and other Tmux configuration files

## Usage
After cloning the repository and running GNU Stow, the dotfiles will be symlinked to your home directory. You can then customize them as needed.

## Updating
To update your dotfiles, simply pull the latest changes from this repository and run GNU Stow again.

```bash 
cd ~/dotfiles
git pull
stow .
```

## Contributing
If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License
This repository is licensed under the WTFPL. See the LICENSE file for more details.
