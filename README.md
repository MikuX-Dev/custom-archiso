# Custom Arch Linux ISO
This repository contains my custom Arch Linux live ISO configuration.

## Overview
The ISO includes:

- Base Arch packages
- XFCE Desktop environment
- NetworkManager for WiFi
- Calamares installer
- Extra utilities like neofetch, vim, git
- AUR packages autobuild
- Custom mkinitcpio and pacman configuration

## Building the ISO
To build the ISO:

Install archiso
Clone this repo
```
Run mkarchiso -v -w work/ -o out/ ./profile
```
The generated ISO will be under out/

## Installation
Boot the ISO and launch the Calamares installer to install to a drive.

## Packages
Base packages, XFCE, and extra utilities are included.

See ./profile/packages.* for the full list.

AUR packages are built using yay and stored under ./aur_packages/

## Configuration
Custom configs:

- ./profile/airootfs/ - system configuration and scripts
- ./profile/mkinitcpio.conf - modified mkinitcpio
- ./profile/pacman.conf - additional repos

## Contributing
Feel free to open PRs or issues to improve the ISO!

Let me know if you would like any sections expanded or additional details covered.