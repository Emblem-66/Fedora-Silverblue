# Silverblue

[![Silverblue](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml/badge.svg)](https://github.com/Emblem-66/Fedora-OSTree-Images/actions/workflows/build.yml)

Custom Fedora Silverblue image. **Currently in development** Use at your own risk.

``` shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/emblem-66/silverblue:latest
```

### Features
- [x] automatic updates

- [x] RPMfusion + COPR

- [x] mesa freeworld, codecs, ffmpeg, system76-scheduler, virt-manager, distrobox

- Gaming
  - [x] steam, bottles, heroic
  - [x] protonplus/up
  - [x] 
- GNOME
  [x] dconf tweaks
  [x] base apps preinstalled as rpm
[] flathub + first boot flatpak install

### Notes
- I am GNOME fanboy and I consider it's workflow superior. But giving Plasma 6 a try. Might end up building 2 images.
- This started as minimal image with all apps as flatpak, however I decided to have working core as a base (meaning text editor, media players/viewers, and base utilities). These utils don't increase the overall image size all that much. Some apps allow me to change settings with dconf (convenient).
- I managed to include steam, heroic, bottles + other gaming tools as rpm, since multiple RUN steps seem to avoid "device out of space" error. keep in mind including heroic specifically increases image size by 2-3 GB. I will see if I keep it.
- mesa-freeworld doesn't cause any issues and seems to be updated quickly. Flatpak programs use flatpak mesa.
- system76-scheduler - apparently it works, not usre how well. Should be install, enable service and boom? No config needed. It's included so I don't have to enable gamemode per game in steam (just make global launch option... Bazzite is using it, Bluefin is using tuned, comming to Fedora in future release, might replace both gamemode and system76-scheduler.
- **Plans for future**:
  - first boot setup - seting up flathub and auto flatpak install
  - slim down the image by removing unnecesary packages
  - automation with systemd services (they are pretty cool)

### References
- [Fedora Silverblue](https://fedoraproject.org/silverblue)
- [uBlue](https://github.com/ublue-os)
- [aguslr](https://github.com/aguslr)
