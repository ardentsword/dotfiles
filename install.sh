#!/bin/bash

sudo apt install zsh
cd "$(dirname "$0")"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
./solve-stow.sh bin
./solve-stow.sh zsh
