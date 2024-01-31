#!/usr/bin/env bash

set -e

show_help() {
  echo "Usage: $0 [-o OUTPUT_DIR] [-p PROFILE_DIR]"
  echo "Options:"
  echo "  -o, --output     Specify the output directory (default: ./out)"
  echo "  -p, --profile    Specify the Archiso profile directory (default: ./profile)"
  echo "  -h, --help       Show this help message"
}

# Default values
output_dir="./out"
profile_dir="./profile"

while [[ "$#" -gt 0 ]]; do
  case $1 in
  -o | --output)
    output_dir="$2"
    shift
    ;;
  -p | --profile)
    profile_dir="$2"
    shift
    ;;
  -h | --help)
    show_help
    exit 0
    ;;
  *)
    echo "Unknown option: $1"
    show_help
    exit 1
    ;;
  esac
  shift
done

echo "Creating dir"
printf "\n"
mkdir -p /tmp/work "$output_dir"

echo "Installing needed pkgs"
printf "\n"
sudo pacman --noconfirm --needed -S archiso mkinitcpio-archiso

echo "Building"
printf "\n"
for dir in "$profile_dir"/*/; do
  sudo mkarchiso -v -w /tmp/work/ -o "$output_dir" "$dir"
  sudo rm -rf /tmp/work/.*
done
