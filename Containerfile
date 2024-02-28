FROM quay.io/fedora/fedora-silverblue:latest
COPY /rootfs/ /
RUN git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita \
    && \
    wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d \
    && \
    wget https://copr.fedorainfracloud.org/coprs/peterwu/iosevka/repo/fedora-$(rpm -E %fedora)/peterwu-iosevka-fedora-$(rpm -E %fedora).repo?arch=x86_64 -O /etc/yum.repos.d/_copr_iosevka.repo \
    && \
    rpm-ostree install iosevka \
    && \
    rpm-ostree install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    && \
    rpm-ostree install \
        distrobox \
        libvirt virt-manager \
        ffmpegthumbnailer \
        ImageMagick \
        adw-gtk3-theme \
        gnome-shell-extension-caffeine \
        gnome-tweaks dconf-editor \
        ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
        adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
    && \
    rpm-ostree override remove \
        firefox firefox-langpacks \
        toolbox \
        yelp yelp-xsl yelp-libs \
        gnome-tour \
        gnome-shell-extension-apps-menu gnome-classic-session \
        gnome-shell-extension-background-logo \
        gnome-shell-extension-launch-new-instance \
        gnome-shell-extension-places-menu \
        gnome-shell-extension-window-list \
    && \
    rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg \
    && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf \
    && \
    sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf \
    && \
    systemctl enable rpm-ostreed-automatic.timer \
    && \
    systemctl enable flatpak-update.service \
    && \
    systemctl enable flatpak-update.timer \
    && \
    fc-cache -f /usr/share/fonts/Microsoft \
    && \
    dconf update \
    && \
    rpm-ostree cleanup -m && rm -rf /var/* /tmp/* && ostree container commit
