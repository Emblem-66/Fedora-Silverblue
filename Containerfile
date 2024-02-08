# BASE
FROM quay.io/fedora/fedora-silverblue:latest AS base
# AUTO UPDATES
# RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer
# RPM-Fusion
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release
# 

# BASE PACKAGES & DEBLOAT & FFmpeg
RUN rpm-ostree install \
distrobox \
podman-compose podman-plugins \
libvirt virt-install virt-manager \
ffmpegthumbnailer \
adw-gtk3-theme \
gnome-shell-extension-caffeine \
&& \
rpm-ostree override remove \
toolbox \
yelp yelp-xsl yelp-libs \
gnome-tour \
gnome-shell-extension-apps-menu gnome-classic-session \
gnome-shell-extension-background-logo \
gnome-shell-extension-launch-new-instance \
gnome-shell-extension-places-menu \
gnome-shell-extension-window-list \
&& \
rpm-ostree install ffmpeg --allowerasing

# Silverblue
FROM base AS silverblue
RUN rpm-ostree override remove firefox firefox-langpacks
# CLEANUP
RUN rpm-ostree cleanup -m && rm -rf /var/log/* /var/cache/* /var/tmp/* /tmp/* /usr/share/doc/* /usr/share/man/*

# SteamBlue
FROM base AS steamblue
# Drivers
# ERROR: RUN rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld    
# ERROR: RUN rpm-ostree install mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld #--allowerasing
# COPR
# Codecs
RUN rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi steam-devices
# PROGRAMS
RUN rpm-ostree install steam goverlay corectrl file-roller loupe celluloid
# CLEANUP
RUN rpm-ostree cleanup -m && rm -rf /var/log/* /var/cache/* /var/tmp/* /tmp/* /usr/share/doc/* /usr/share/man/*
