FROM quay.io/fedora/fedora-silverblue:latest
# REPOS & UPDATES
COPY /rootfs/ /
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    systemctl enable flatpak-update.service && \
    systemctl enable flatpak-update.timer && \
    systemctl disable flatpak-add-fedora-repos && \
    wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d && \
    rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# BASE PACKAGES & DEBLOAT & FFmpeg
RUN rpm-ostree install \
    distrobox \
    vscode \
    libvirt virt-manager \
    ffmpegthumbnailer \
    ImageMagick \
    adw-gtk3-theme \
    gnome-shell-extension-caffeine \
    gnome-tweaks \
    ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
    redhat-display-fonts redhat-text-fonts \
    lato-fonts \
    jetbrains-mono-fonts \
    fira-code-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts \
    adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
    intel-clear-sans-fonts intel-one-mono-fonts \
    && \
    fc-cache -f /usr/share/fonts/ 
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
    rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg
# CLEANUP
RUN rpm-ostree cleanup -m && rm -rf /var/* /tmp/* && ostree container commit
