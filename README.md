# Fedora OSTree images
[![SilverBlue](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-silverblue.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-silverblue.yml)
[![SteamBlue](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-steamblue.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build-steamblue.yml)
[![build](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)


Custom Fedora images based on official Fedora ostree images. 
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

## Silverblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-silverblue:latest
```
Slimmed down Fedora Silverblue to be used with flatpaks.

## SteamBlue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-steamblue:latest
```
Fedora Silverblue with all the packages included.

## Kinoite
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/fedora-kinoite:latest
```
Slimmed down Kinoite without crap like kwallet.

# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# Notes
- Cosign - don't see a reason, not gonna bother
- Licence - it's just bunch of lines in text files, not gonna bother