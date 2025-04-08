#!/bin/bash
#cp -r ~/.config/alacritty ~/github_EzLucca/Dotfiles
#cp -r ~/.config/hypr ~/github_EzLucca/Dotfiles
#cp -r ~/.config/i3 ~/github_EzLucca/Dotfiles
#cp -r ~/.config/nvim ~/github_EzLucca/Dotfiles
#cp -r ~/.config/polybar ~/github_EzLucca/Dotfiles
#cp -r ~/.config/tofi ~/github_EzLucca/Dotfiles
#cp -r ~/.config/waybar ~/github_EzLucca/Dotfiles
#cp -r ~/.config/dunst ~/github_EzLucca/Dotfiles
#cp -r ~/.zshrc ~/github_EzLucca/Dotfiles
#cp -r ~/.config/compfy ~/github_EzLucca/Dotfiles
#cp -r ~/.config/rofi ~/github_EzLucca/Dotfiles
cp -r ~/.config/nvim ~/github_EzLucca/Dotfiles
cp -r ~/.bashrc ~/github_EzLucca/Dotfiles
cp -r ~/.vimrc ~/github_EzLucca/Dotfiles
cp -r ~/.tmux.conf ~/github_EzLucca/Dotfiles

cd ~/github_EzLucca/Dotfiles
git add --all
git commit
git push

