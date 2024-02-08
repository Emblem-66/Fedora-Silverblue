# Fedora OSTree Images
[![Builds](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/fedora-ostree/actions/workflows/build.yml)

Custom Fedora ostree images.
- Virt-manager added
- FFmpeg added
- Distrobox instead of Toolbox

## Silverblue 
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```
Slimmed down Fedora Silverblue to be used with flatpaks.

## Steamblue
``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/steamblue:latest
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


|  |  |
|-----------------|-----------------|
| Row 1, Col 1    | Row 1, Col 2    | 
| Row 2, Col 1    | Row 2, Col 2    |
| Row 3, Col 1    | Row 3, Col 2    |
| Row , Col 1    | Row 4, Col 2    |