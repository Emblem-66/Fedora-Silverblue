FROM quay.io/fedora/fedora-silverblue:latest
COPY rootfs/ /
RUN LOCATION=$(curl -s https://api.github.com/repos/ONLYOFFICE/DesktopEditors/releases/latest \
    | grep "browser_download_url" \
    | grep "onlyoffice-desktopeditors.x86_64.rpm" \
    | cut -d '"' -f 4) \
    ; curl -L -o /tmp/onlyoffice-desktopeditors.x86_64.rpm $LOCATION
RUN rpm-ostree install \
      https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
      https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN rpm-ostree install /tmp/onlyoffice-desktopeditors.x86_64.rpm
RUN rpm-ostree install $(< /tmp/gaming-packages)
RUN rpm-ostree override remove $(< /tmp/base-packages)
RUN rpm-ostree cleanup -m \ 
&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable libvirtd.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl enable dconf-update.service \
&&  git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita \
&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  rm -rf /tmp /var
