#!/bin/bash

echo "downloding packages.."

declare -A neovim=(
	[name]="neovim"
	[bin]=0
)

declare -A obsidian=(
	[name]="obsidian"
	[bin]=0
)

declare -A spotify=(
	[name]="spotify-launcher"
	[bin]=0
)

declare -A waybar=(
	[name]="waybar"
	[bin]=0
)

declare -A hyprpaper=(
	[name]="hyprpaper"
	[bin]=0
)

declare -A git=(
	[name]="git"
	[bin]=0
)

declare -A openssh=(
	[name]="openssh"
	[bin]=0
)

declare -A brightness=(
	[name]="brightnessctl"
	[bin]=0
)

declare -A hyprlock=(
	[name]="hyprlock"
	[bin]=0
)

declare -A mpd=(
	[name]="mpd"
	[bin]=0
)

packages=("neovim" "obsidian" "spotify" "waybar" "hyprpaper" "git" "openssha" "brightness" "hyprlock" "mpd")

for package in "${packages[@]}"; do
	declare -n current="${package}"
	if pacman -Qi ${current[name]} &>/dev/null; then
		echo "${current[name]} is already installed"
	else
		echo "Installing ${current[name]}..."
		sudo pacman -S --noconfirm ${current[name]}
		if [[ ${currnet[bin]} == 1 ]]; then
			echo "Making ${current[name]} package..."
			cd ${current[name]}
			makepkg -si
		fi
	fi
done

sudo pacman -Syu
sudo pacman -S --needed base-devel git

YAY_DIRECTORY="~/.config/yay-git"
if [ -d "$YAY_DIRECTORY" ]; then
	echo "Yay already downloaded"
else
	echo "Installing yay..."
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si --noconfirm
	echo "Installed yay"
fi

BRAVE_DIRECTORY="~/.config/brave-bin"
if [ -d "$BRAVE_DIRECTORY" ]; then
	echo "Brave already downloaded"
else
	echo "Install Brave..."
	yay -S brave-bin --noconfirm
	cd brave-bin
	makepkg -si --noconfirm
	echo "Installed Brave"
fi
NERD_FONTS="~/.config/nerd-fonts-git"
if [ -d "$NERD_FONTS" ]; then
	echo "nerd fonts already downloaded"
else
	echo "Installing nerd fonts"
	yay -S nerd-fonts-git
	cd nerd-fonts-git
	makepkg -si --noconfirm
	echo "Installed nerd-fonts"
fi
