FROM quay.io/fedora/fedora-silverblue:latest
COPY rootfs/ /
RUN rpm-ostree install \
      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN rpm-ostree install steam
RUN rpm-ostree install heroic-games-launcher-bin
RUN rpm-ostree install bottles
RUN rpm-ostree install prismlauncher
RUN rpm-ostree install goverlay mangohud protonplus protontricks
RUN rpm-ostree override remove $(< /tmp/base-packages)
RUN rpm-ostree cleanup -m \
&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl disable NetworkManager-wait-online.service \
&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  rm -rf /tmp /var
