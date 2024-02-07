# Fedora OSTree images
[![Builds](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora images based on official Fedora ostree images. 
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

### Silverblue 
``
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
``
Slimmed down Fedora Silverblue to be used with flatpaks.

## Steamblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/steamblue:latest
```
Fedora Silverblue with extra packages installed, like steam, corectrl, goverlay.

# References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [RPM-Fusion](https://rpmfusion.org/Howto/OSTree)
- [Virt-Manager](https://virt-manager.org)
- [Distrobox](https://github.com/89luca89/distrobox)
- [Inspiration: uBlue](https://github.com/ublue-os)
# Notes
- Cosign - don't see a reason, not gonna bother.
- Licence - don't see a reason, not gonna bother.
