# vim: set ft=make :

# Restore zeropoint customized DE settings
restore-gnome-de-settings:
    for file in /usr/share/ublue-os/dconfs/desktop-silverblue/*; do
    dconf load / < "${file}"
    done
    for file in /usr/share/ublue-os/dconfs/deck-silverblue/*; do
    dconf load / < "${file}"
    done

# Restore zeropoint customized applications folders
restore-gnome-folders:
    dconf load / < /usr/share/ublue-os/dconfs/desktop-silverblue/zz0-02-zeropoint-desktop-silverblue-folders
    dconf load / < /usr/share/ublue-os/dconfs/desktop-silverblue/01-zeropoint-desktop-silverblue-folders

# Change automatic power profile switching behavior
configure-auto-power-profile ACTION="help":
    #!/usr/bin/bash
    source /usr/lib/ujust/ujust.sh
    OPTION={{ ACTION }}
    if [ "$OPTION" == "help" ]; then
      echo "Usage: ujust configure-auto-power-profile <option>"
      echo "  Use 'enable' to allow automatic power profile switching based on power state
      echo "  Use 'disable' to prevent automatic power profile switching based on power state
      exit 0
    if [[ "${OPTION,,}" =~ enable ]]; then
      gnome-extensions enable auto-power-profile@dmy3k.github.io
    elif [[ "${OPTION,,}" =~ disable ]]; then
      gnome-extensions disable auto-power-profile@dmy3k.github.io
    fi
