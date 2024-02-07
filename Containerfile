FROM quay.io/fedora/fedora-silverblue:latest AS builder-silverblue
# AUTO UPDATES
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer
# RPM-Fusion
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release
# DEBLOAT
RUN rpm-ostree override remove toolbox yelp yelp-xsl yelp-libs gnome-tour gnome-shell-extension-apps-menu gnome-classic-session gnome-shell-extension-background-logo gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu gnome-shell-extension-window-list
# BASE PACKAGES
RUN rpm-ostree install distrobox podman-compose podman-plugins libvirt virt-install virt-manager ffmpegthumbnailer adw-gtk3-theme gnome-shell-extension-caffeine
# FFmpeg
RUN rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg

FROM builder-silverblue AS silverblue
RUN rpm-ostree override remove firefox firefox-langpacks

FROM builder-silverblue AS steamblue
# Drivers
# ERROR: RUN rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld    
# ERROR: RUN rpm-ostree install mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld #--allowerasing
# COPR
# Codecs
RUN rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi steam-devices
# PROGRAMS
RUN rpm-ostree install steam goverlay corectrl file-roller loupe celluloid
