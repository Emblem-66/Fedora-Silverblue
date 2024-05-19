FROM quay.io/fedora/fedora-silverblue:latest

COPY	rootfs/ /

RUN 	rm -r /usr/lib/fedora-third-party && \
	rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
	rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
	rm /etc/yum.repos.d/google-chrome.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
	rm /etc/yum.repos.d/fedora-updates-archive.repo

RUN	rpm-ostree override remove \
		toolbox \
		yelp yelp-xsl yelp-libs \
		gnome-tour \
		gnome-shell-extension-apps-menu \
		gnome-shell-extension-launch-new-instance \
		gnome-shell-extension-places-menu \
		gnome-shell-extension-window-list \
		gnome-shell-extension-background-logo \
		gnome-classic-session gnome-classic-session-xsession \
		gnome-terminal gnome-terminal-nautilus

RUN	rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
	rpm-ostree install rpmfusion-free-release rpmfusion-nonfree-release --uninstall rpmfusion-free-release --uninstall rpmfusion-nonfree-release && \
	wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
	wget https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_atim-heroic-games-launcher-repo && \
	wget https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo && \
	wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

RUN	rpm-ostree override remove mesa-va-drivers && rpm-ostree install mesa-va-drivers-freeworld mesa-vdpau-drivers-freeworld
RUN	rpm-ostree install gstreamer1-libav gstreamer1-plugin-openh264 gstreamer1-vaapi gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly

RUN	rpm-ostree install \
		distrobox \
		adw-gtk3-theme \
		gnome-shell-extension-caffeine \
		gnome-shell-extension-dash-to-dock \
		system76-scheduler \
		gnome-shell-extension-system76-scheduler \
		virt-manager \
		virt-install \
		virt-viewer \
		libvirt \
		libvirt-daemon-config-network \
		libvirt-daemon-kvm \
		qemu-kvm \
		ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
		adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
		cascadia-code-fonts rsms-inter-fonts

RUN	rpm-ostree install \
		ffmpegthumbnailer \
		gnome-tweaks \
		gnome-console \
		gnome-calculator \
		gnome-calendar \
		gnome-text-editor \
		file-roller \
		fsearch \
		sushi \
		evince \
		loupe gthumb \
		transmission fragments \
		celluloid g4music cozy

RUN	rpm-ostree install \
		steam \
		bottles \
		heroic-games-launcher-bin \
		mangohud

RUN	fc-cache -f /usr/share/fonts/ && \
	git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com && \
	systemctl enable com.system76.Scheduler.service && \
	systemctl enable libvirtd.service && \
	systemctl enable rpm-ostreed-automatic.timer && \
	systemctl enable flatpak-update.service && \
	systemctl enable flatpak-update.timer && \
	systemctl enable dconf-update.service && \
	sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
	sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
	rpm-ostree cleanup -m
