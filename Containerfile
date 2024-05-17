FROM quay.io/fedora/fedora-silverblue:latest

# Configs
COPY rootfs/ /
RUN systemctl enable rpm-ostreed-automatic.timer && \
	systemctl enable flatpak-update.service && \
	systemctl enable flatpak-update.timer && \
	systemctl enable dconf-update.service

# DEBLOAT
RUN rm -r /usr/lib/fedora-third-party && \
	rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
	rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
	rm /etc/yum.repos.d/google-chrome.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
	rm /etc/yum.repos.d/fedora-updates-archive.repo && \
	rpm-ostree override remove toolbox yelp yelp-xsl yelp-libs gnome-tour firefox firefox-langpacks

# REPOS
RUN rpm-ostree install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
	wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

# Git clone
RUN git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com

# GENERAL
RUN rpm-ostree install \
		adw-gtk3-theme \
		ffmpegthumbnailer \
		gnome-shell-extension-caffeine # file-roller loupe gthumb gnome-calendar gnome-text-editor gnome-calculator evince fragments celluloid g4music cozy

# GAMING
RUN rpm-ostree install steam steam-devices bottles goverlay mangohud

# MEDIA
# RUN rpm-ostree override remove libavdevice-free libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg
# RUN rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi 
# RUN rpm-ostree install ffmpeg

# System76 Scheduler
RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && rpm-ostree install system76-scheduler && systemctl enable com.system76.Scheduler.service

# IINPUT REMMAPER
RUN rpm-ostree install input-remapper && systemctl enable input-remapper

# Virtualisation
RUN rpm-ostree install virt-manager && systemctl enable libvirtd.service

# FONTS
RUN rpm-ostree install \
		ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
		adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
		sorkintype-merriweather-fonts sorkintype-merriweather-sans-fonts \
		mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts \
		rsms-inter-fonts levien-inconsolata-fonts jetbrains-mono-fonts cascadia-code-fonts && \
	fc-cache -f /usr/share/fonts/

# FINISH
RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
	sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
	rpm-ostree cleanup -m && rm -rf /var/* /tmp/* && ostree container commit
