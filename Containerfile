FROM quay.io/fedora/fedora-silverblue:latest
# Debloat
RUN rpm-ostree override remove toolbox firefox firefox-langpacks yelp gnome-tour 
# RPM-Fusion
RUN rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release
# Drivers
RUN rpm-ostree override remove mesa-va-drivers --install=mesa-va-drivers-freeworld --install=mesa-vdpau-drivers-freeworld
# FFmpeg & Codecs
RUN rpm-ostree override remove libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg
RUN rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi
# Packages
RUN rpm-ostree install adw-gtk3-theme ffmpegthumbnailer
# Distrobox
RUN rpm-ostree install distrobox
# mkdir -p /etc/distrobox && echo "container_image_default=\"registry.fedoraproject.org/fedora-toolbox:$(rpm -E %fedora)\"" >> /etc/distrobox/distrobox.conf
# Virt-manager
RUN rpm-ostree install libvirt virt-install virt-manager
# Auto updates
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=check/' /etc/rpm-ostreed.conf && systemctl enable rpm-ostreed-automatic.timer
