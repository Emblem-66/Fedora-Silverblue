# fedora-ostree
[![build](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora image based on official Fedora ostree image.

## Silverblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-silverblue:latest
```
### List of changes
- Automatic updates - "stage"
- RPM-Fusion enabled
- Removed
  - firefox
  - toolbox
  - gnome extensions
  - gnome-help
  - gnome-tour
- Added
  - adw-gtk3-theme
  - ffmpegthumbnailer
  - caffeine gnome extension 
  - ffmpeg
  - Virt-manager
## Kinoite
Waiting for Fedora 40
Looking to slim down KDE - removing apps that are available on flathub (Ark, KWrite,...)
# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# ToDo
- Cosign