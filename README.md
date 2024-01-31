# Custom Arch Linux ISO

This repository contains my custom "archiso" configuration. Archiso project features scripts and configuration templates to build installation media (*.iso* images and
*.tar.gz* bootstrap images) as well as netboot artifacts for BIOS and UEFI based systems on the x86_64 architecture.
Currently creating the images is only supported on Arch Linux but may work on other operating systems as well.

## Requirements

> **NOTE:**
> Before getting started know more about [archiso](https://wiki.archlinux.org/title/archiso).

The following packages need to be installed to be able to create an image with the included scripts:

* archiso
* arch-install-scripts
* awk
* dosfstools
* e2fsprogs
* erofs-utils (optional)
* findutils
* grub
* gzip
* libarchive
* libisoburn
* mtools
* openssl
* pacman
* sed
* squashfs-tools

> **NOTE:**
> archiso has all the packages that are mentioned above.

For running the images in a virtualized test environment the following packages are required:

* edk2-ovmf
* qemu

For linting the shell scripts the following package is required:

* shellcheck

## Profiles

Archiso comes with two profiles: **baseline** and **releng**. While I choose to use **releng** but both can serve as starting points for creating
custom live media, **releng** is used to create the monthly installation medium.

## Overview

The ISO includes:

* Base Arch packages
* XFCE Desktop environment
* NetworkManager for WiFi
* Calamares installer
* Extra utilities like neofetch, vim, git
* Custom configured

## Building the ISO

To build the ISO:

Simply run this script.

```bash
chmod +x build-iso.sh && ./build-iso.sh
```

The generated ISO will be under ~/out

## Installation

Boot the ISO and launch the Calamares installer to install to a drive.

## Packages

Base packages, XFCE, and extra utilities are included.

See ./profile/*/packages.x86_64 for the full list.

AUR packages are built using yay and stored under ./aur_packages/

## Configuration

Custom configs:

* ./profile/*/airootfs/ - system configuration and scripts
* ./profile/*/packages.x86_64 - modified packages
* ./profile/*/pacman.conf - additional repos

## Contributing

Feel free to open PRs or issues to improve the ISO!

## License

Archiso is licensed under the terms of the [MIT](https://github.com/MikuX-Dev/custom-archiso/blob/master/LICENSE).
