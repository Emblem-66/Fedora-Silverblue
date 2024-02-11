#-------------------- BASE --------------------#
FROM quay.io/fedora/fedora-silverblue:latest AS base
# AUTO UPDATES
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer
# RPM-Fusion
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 
# BASE PACKAGES & DEBLOAT & FFmpeg
RUN rpm-ostree install \
    distrobox \
    libvirt virt-manager virt-install \
    ffmpegthumbnailer \
    adw-gtk3-theme \
    gnome-shell-extension-caffeine \
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