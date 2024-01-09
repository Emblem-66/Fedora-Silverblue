# fedora-ostree
[![build](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora Silverblue/Kinoite image for my taste.
Based on official Fedora Silverblue/Kinoite image.

GNOME:
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-silverblue:latest
```

**Note: KDE builds are disabled**

KDE:
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-kinoite:latest
```

## List of changes
### Silverblue & Kinoite
- Automatic updates - "stage"
- RPM-Fusion enabled
- Hardware codecs AMD (mesa-freeworld)
- Software codecs
- Removed Firefox
- Distrobox instead of Toolbox
- Virt-manager
### Silverblue
- Removed
  - gnome extensions
  - gnome-help
  - gnome-tour
- Added
  - adw-gtk3-theme
  - ffmpegthumbnailer
  - gnome extensions
    - blur-my-shell
    - caffeine
    - dash-to-dock
    - gsconnect
    - forge
    - just-perfection
### Kinoite
Waiting for Fedora 40
Looking to slim down KDE - removing apps that are available on flathub (Ark, KWrite,...)
# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# ToDo
- Cosign
- Potential bug and typo fixes
- Maybe some more customisation
