#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archfiery-xfce4"
iso_label="ARCHFIERY_XFCE4_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%d%m%Y)"
iso_publisher="MikuX-Dev <https://github.com/MikuX-Dev>"
iso_application="ARCHFIERY-XFCE4 Live/Installation/Rescue CD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%d.%m.%Y)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
  'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
  'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:0400"
  ["/etc/sudoers.d"]="0:0:750"

  ["/etc/skel/bin"]="0:0:755"
  ["/etc/skel/bin/random_script_runner.sh"]="0:0:755"

  ["/root"]="0:0:750"
  ["/root/bin"]="0:0:755"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/bin/bin/random_script_runner.sh"]="0:0:755"

  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
)
