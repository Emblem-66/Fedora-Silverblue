# Fedora OSTree images
[![build](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora image based on official Fedora ostree image.

## Silverblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-silverblue:latest
```
### List of changes
- Automatic updates
- RPM-Fusion enabled
- Removed
  - firefox
  - toolbox
  - gnome extensions
  - gnome-help
  - gnome-tour
- Added
  - adw-gtk3-theme
  - ffmpeg
  - ffmpegthumbnailer
  - caffeine gnome extension
  - distrobox
  - podman
  - virt-manager

## SteamBlue
RPMs instead of flatpaks. Just rebase and have everything.
# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# ToDo
- Cosign