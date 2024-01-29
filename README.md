# Fedora OSTree images
[![Silverblue](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-silverblue.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-silverblue.yml)
[![Steamblue](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-steamblue.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-steamblue.yml)
[![Kinoite](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-kinoite.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-kinoite.yml)

Custom Fedora images based on official Fedora ostree images. 
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

## Silverblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-silverblue:latest
```
Slimmed down Fedora Silverblue to be used with flatpaks.

## Steamblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-steamblue:latest
```
Fedora Silverblue with extra packages installed, like steam, corectrl, goverlay.

## Kinoite
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-kinoite:latest
```
Slimmed down Kinoite without crap like kwallet.

# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# Notes
- Cosign - don't see a reason, not gonna bother.
- Licence - don't see a reason, not gonna bother.
