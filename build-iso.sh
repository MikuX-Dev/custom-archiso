#!/usr/bin/env bash

set -e

packages_file="./profile/aur_package"
output_dir="./aur_packages"

output_dir="$(readlink -f "$output_dir")"

mkdir -p "$output_dir"

while read -r package; do
  git clone "https://aur.archlinux.org/$package.git"
  cd "$package"
  makepkg -sf --noconfirm --needed --noprogressbar
  # shellcheck disable=SC2035
  cp *.pkg.tar.* "$output_dir"
  cd ..
done <"$packages_file"

mkdir -p /tmp/archlive
cp -r . /tmp/archlive

pacman --noconfirm -S archiso

find /tmp/archlive
cd /tmp/archlive

sed -i "s#^Server = file:///home/custompkgs#Server = file://${output_dir}#" ./profile/pacman.conf

mkdir {work,out}
mkarchiso -v -w work/ -o out/ ./profile
