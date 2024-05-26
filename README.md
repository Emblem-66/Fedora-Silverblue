# Silverblue

[![Silverblue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml)

Custom Fedora Silverblue image. **Currently in development** Use at your own risk.

``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```

### Features
[x] automatic updates
[x] RPMfusion + COPR
[x] mesa freeworld, codecs, ffmpeg, system76-scheduler, virt-manager, distrobox
- GNOME
  [x] dconf tweaks
  [x] base apps preinstalled as rpm
[] flathub + first boot flatpak install

### Notes
- This started as minimal image with all apps as flatpak, however I decided to have working core as a base (meaning text editor, media players/viewers, and base utilities). These utils don't increase the overall image size all that much. Some apps allow me to change settings with dconf (convenient).
- I wanted to include steam, heroic, bottles + other gaming tools as rpm, however - while steam and bottles work in my experience both well as rpm and flathub, heroic rpm increases image size by 2-3GB, due to wine being dependency, leading to errors when building. I decided to at least for now use flatpak versions instead.
- mesa-freeworld doesn't cause any issues and seems to be updated quickly. Flatpak programs use flatpak mesa.
- system76-scheduler - *Felling cute, might remove later...* Well Bazzite is using it, but I have no idea if it works - gamemode is shown in mangohud, this is not. Reason for system76-scheduler is so I don't have to add it as launch command. Bluefin is using tuned, comming to Fedora in future release, might replace both gamemode and system76-scheduler.
- **Plans for future**:
  - first boot setup - seting up flathub and auto flatpak install
  - slim down the image by removing unnecesary packages
  - automation with systemd services (they are pretty cool)

### References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [uBlue](https://github.com/ublue-os)
- [aguslr](https://github.com/aguslr)
