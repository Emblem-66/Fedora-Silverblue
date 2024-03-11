# Silverblue
[![Silverblue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml)

Custom Fedora Silverblue image.

``` shell
rpm-ostree cancel && rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```
### Features
- automatic updates
- virt-manager, distrobox
- flathub
- GNOME
  - adw-gtk3-theme
  - dconf
  - extensions
  - fonts
### Plans
- first run setup (install flatpaks, setup homebrew, etc)
### References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Flathub](https://flathub.org)
- [Inspiration: uBlue](https://github.com/ublue-os)
