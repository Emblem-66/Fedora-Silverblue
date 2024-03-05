FROM quay.io/fedora/fedora-silverblue:latest

# Copy files and configs
COPY rootfs/ /

# Download stuff and repos
RUN wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d && \
    rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
    rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
    git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com    

# Install packages
RUN rpm-ostree install \
        distrobox \
        virt-manager \
        ffmpegthumbnailer \
        adw-gtk3-theme \
        gnome-shell-extension-caffeine \
        ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts

# Uninstall packages
RUN rpm-ostree override remove \
        firefox firefox-langpacks \
        toolbox \
        yelp yelp-xsl yelp-libs \
        gnome-tour \
        gnome-shell-extension-apps-menu gnome-classic-session \
        gnome-shell-extension-background-logo \
        gnome-shell-extension-launch-new-instance \
        gnome-shell-extension-places-menu \
        gnome-shell-extension-window-list

# Setup services
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable flatpak-update.service && \
    systemctl enable flatpak-update.timer && \
    systemctl enable dconf-update.service && \
    fc-cache -f /usr/share/fonts/

# Cleanup
RUN rpm-ostree cleanup -m && rm -rf /var/* /tmp/* && ostree container commit
