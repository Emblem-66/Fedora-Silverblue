FROM quay.io/fedora/fedora-silverblue:latest

# Debloat
RUN rpm-ostree override remove firefox firefox-langpacks 
RUN rpm-ostree override remove yelp yelp-xsl yelp-libs gnome-tour
RUN rpm-ostree override remove gnome-shell-extension-apps-menu \
    gnome-shell-extension-background-logo \
    gnome-shell-extension-launch-new-instance \
    gnome-shell-extension-places-menu \
    gnome-shell-extension-window-list \
RUN rpm-ostree override remove toolbox

# RPM-Fusion
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Drivers
RUN rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld
RUN rpm-ostree override remove mesa-vdpau-drivers --install mesa-vdpau-drivers-freeworld
# RUN rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld

# FFmpeg & Codecs
RUN rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg
RUN rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi

# Packages
RUN rpm-ostree install adw-gtk3-theme ffmpegthumbnailer \
    gnome-shell-extension-blur-my-shell \
    gnome-shell-extension-caffeine \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-forge \
    gnome-shell-extension-just-perfection

# Distrobox
RUN rpm-ostree install distrobox

# Virt-manager
RUN rpm-ostree install libvirt virt-install virt-manager

# Auto updates
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=check/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer
