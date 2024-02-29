# Silverblue
[![Silverblue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml)

Custom Fedora Silverblue image.

``` shell
rpm-ostree cancel && rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```
### Features
- Automatic Updates
  - [x] rpm-ostree
  - [x] flatpak
- virt-manager, distrobox
- ffmpeg, imagemagick
- flathub
- GNOME
  - [x] adw-gtk3-theme
  - [ ] dconf
  - [x] extensions
  - [ ] fonts
  ### References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Flathub](https://flathub.org)
- [FFmpeg](https://ffmpeg.org)
- [ImageMagick](https://imagemagick.org)
- [Inspiration: uBlue](https://github.com/ublue-os)
