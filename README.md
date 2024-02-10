# Fedora OSTree Images
[![Silverblue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build-silverblue.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build-silverblue.yml)
[![SteamBlue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build-steamblue.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build-steamblue.yml)

Custom Fedora ostree images.
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

## Silverblue 
``` shell
rpm-ostree cancel && rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```
Slimmed down Fedora Silverblue to be used with flatpaks.

## SteamBlue
``` shell
rpm-ostree cancel && rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/steamblue:latest
```
Fedora Silverblue with programs.

# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# Notes
- Cosign - don't see a reason, not gonna bother.
- Licence - don't see a reason, not gonna bother.
