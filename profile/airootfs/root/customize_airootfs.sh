#!/usr/bin/env bash

set -e -u

#==> main
main() {
  copyconf
  copycaltodesk
  setusersp
}

#==> Set user shell and permission
setusersp() {
  na
}

#==> Copy Config To Root Dir
copyconf() {
  rdir="/root/.config"
  sdir="/etc/skel"
  if [[ ! -d "$rdir" ]]; then
    mkdir -p "$rdir"
  fi

  if [[ ! -d "$rdir" ]]; then
    cp -r "$sdir"/.* "$rdir"
  fi
}

#==> Copy Calamares to Desktop
copycaltodesk() {
  _desktop="/home/liveuser/Desktop"

  if [[ ! -d "${_desktop}" ]]; then
    mkdir -p "${_desktop}"
  fi

  cp /usr/share/applications/calamares.desktop "${_desktop}"
  chown -R liveuser:users "${_desktop}"
  chmod +x "${_desktop}"/calamares.desktop
}
