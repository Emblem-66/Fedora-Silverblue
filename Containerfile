FROM quay.io/fedora/fedora-silverblue:latest
RUN rm /etc/rpm-ostreed.conf
# RPMfusion & COPR
#RUN curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora) \
#&&  curl -Lo /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora) \
#&&  rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
COPY rootfs/ /

# Drivers & Codecs
RUN rpm-ostree override remove \
        mesa-va-drivers \
        noopenh264 \
&&  rpm-ostree install \
        mesa-va-drivers-freeworld \
        mesa-vdpau-drivers-freeworld \
        libavcodec-freeworld \
&&  rpm-ostree cleanup -m
RUN rpm-ostree install $(< install-packages)
RUN rpm-ostree install $(< extra-packages)
RUN rpm-ostree override remove $(< delete-packages)
RUN fc-cache -f /usr/share/fonts/ \
&&  systemctl enable com.system76.Scheduler.service \
&&  systemctl enable libvirtd.service \
&&  systemctl enable rpm-ostreed-automatic.timer \
&&  systemctl enable flatpak-update.service \
&&  systemctl enable flatpak-update.timer \
&&  systemctl enable dconf-update.service \
&&  rm /install-packages \
&&  rm /delete-packages \
&&  rm /extra-packages \
&&  git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita \
&&  git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com \
&&  wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d \
&&  rpm-ostree cleanup -m

#&&  sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf \
#&&  sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf \

