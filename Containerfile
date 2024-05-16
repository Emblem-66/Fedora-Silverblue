FROM quay.io/fedora/fedora-silverblue:latest

# Copy files and configs
COPY rootfs/ /

# Repos
RUN rm -r /usr/lib/fedora-third-party && \
	rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
	rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
    rm /etc/yum.repos.d/google-chrome.repo && \
    rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo && \
    rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
    rm /etc/yum.repos.d/fedora-updates-archive.repo && \
	rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm rpmfusion-free-release rpmfusion-nonfree-release --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release && \
	wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
	wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d && \
	git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
    git clone https://github.com/mjakeman/s76-scheduler-plugin /usr/share/gnome-shell/extensions/s76-scheduler@mattjakeman.com && \
    git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com

RUN rpm-ostree override remove \
		libavfilter-free libavformat-free libavcodec-free libavutil-free libpostproc-free libswresample-free libswscale-free --install=ffmpeg && \
    rpm-ostree install \
		gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi && \
	rpm-ostree override remove \
		mesa-va-drivers --install=mesa-va-drivers-freeworld && \
	rpm-ostree install \
		mesa-vdpau-drivers-freeworld && \
	rpm-ostree install \
		ffmpeg discord && \
	rpm-ostree install \
		steam steam-devices lutris bottles goverlay mangohud input-remapper system76-scheduler && \
	rpm-ostree install \
		cozy celluloid g4music && \
	rpm-ostree install \
		gnome-calendar gnome-text-editor gnome-calculator evince && \
	rpm-ostree install \
		fragments transmission && \
	rpm-ostree install \
        distrobox virt-manager \
        adw-gtk3-theme gnome-shell-extension-caffeine \
        ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts sorkintype-merriweather-fonts sorkintype-merriweather-sans-fonts rsms-inter-fonts levien-inconsolata-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts jetbrains-mono-fonts cascadia-code-fonts

# Uninstall packages
RUN rpm-ostree override remove \
        toolbox \
        yelp yelp-xsl yelp-libs \
        gnome-tour \
        gnome-shell-extension-apps-menu gnome-classic-session gnome-classic-session-xsession \
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
    systemctl enable libvirtd.service && \
    systemctl enable input-remapper && \
    systemctl enable com.system76.Scheduler.service && \
    fc-cache -f /usr/share/fonts/

# Cleanup
RUN rpm-ostree cleanup -m && rm -rf /var/* /tmp/* && ostree container commit
