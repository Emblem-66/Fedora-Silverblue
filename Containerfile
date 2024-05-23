FROM quay.io/fedora/fedora-silverblue:latest
COPY rootfs/ /
#RUN rpm-ostree install \
#      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
#      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
#&&  rpm-ostree override remove \
#      mesa-va-drivers \
#      noopenh264 \
#&&  rpm-ostree install \
#      mesa-va-drivers-freeworld \
#      mesa-vdpau-drivers-freeworld \
#      libavcodec-freeworld \
RUN wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d \
&&  rpm-ostree override remove $(< /packages/delete-packages) \
&&  rpm-ostree install $(< /packages/install-packages) \
&&  rpm-ostree install $(< /packages/extra-packages) \
&&  fc-cache -f /usr/share/fonts/ \
&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable libvirtd.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl enable dconf-update.service \
&&  git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita \
&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  rpm-ostree cleanup -m \
&&  rm -rf /tmp/* /var/* /packages/*
