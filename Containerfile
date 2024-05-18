FROM quay.io/fedora/fedora-silverblue:latest

COPY rootfs/ /

RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
	rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
	rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release && \
	wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d && \
	rm -r /usr/lib/fedora-third-party && \
	rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
	rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
	rm /etc/yum.repos.d/google-chrome.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
	rm /etc/yum.repos.d/fedora-updates-archive.repo

RUN rpm-ostree override remove \
		toolbox \
		yelp yelp-xsl yelp-libs \
		gnome-tour \
		gnome-shell-extension-apps-menu \
		gnome-shell-extension-launch-new-instance \
		gnome-shell-extension-places-menu \
		gnome-shell-extension-window-list \
		gnome-shell-extension-background-logo \
		gnome-classic-session \
		gnome-classic-session-xsession

RUN rpm-ostree install ffmpeg gstreamer1-plugin-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-vaapi && \
	rpm-ostree override remove mesa-va-drivers && rpm-ostree install mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld

RUN rpm-ostree install \
		distrobox gnome-tweaks \
		gnome-console \
		gnome-calculator \
		gnome-calendar \
		gnome-text-editor \
		adw-gtk3-theme yaru-theme \
		gnome-shell-extension-caffeine \
		gnome-shell-extension-dash-to-dock

RUN rpm-ostree install \
		steam \
		bottles \
		lutris \
		mangohud \
		transmission fragments \
		celluloid clapper g4music cozy \
		epiphany chromium

RUN rpm-ostree install \
		virt-manager \
		input-remapper \
		system76-scheduler gnome-shell-extension-system76-scheduler

RUN rpm-ostree install \
		ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
		adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
		sorkintype-merriweather-fonts sorkintype-merriweather-sans-fonts \
		mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts \
		levien-inconsolata-fonts jetbrains-mono-fonts cascadia-code-fonts \
		lato-fonts rsms-inter-fonts

RUN git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com && \
	systemctl enable rpm-ostreed-automatic.timer && \
	systemctl enable flatpak-update.service && \
	systemctl enable flatpak-update.timer && \
	systemctl enable dconf-update.service && \
	systemctl enable libvirtd.service && \
	systemctl enable input-remapper && \
	systemctl enable com.system76.Scheduler.service && \
	sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
	sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
	fc-cache -f /usr/share/fonts/ && \
	rpm-ostree cleanup -m && rm -rf /var/* /tmp/*
