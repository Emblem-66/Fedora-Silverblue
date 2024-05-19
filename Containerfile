FROM quay.io/fedora/fedora-silverblue:latest

### RPMFusion & COPR 
# wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
# curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo && \

# wget https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-$(rpm -E %fedora)/atim-heroic-games-launcher-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo && \
# curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo && \
# curl -Lo /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-$(rpm -E %fedora)/atim-heroic-games-launcher-fedora-$(rpm -E %fedora).repo && \

# wget https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora)/cboxdoerfer-fsearch-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo && \
# curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo && \
# curl -Lo /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora)/cboxdoerfer-fsearch-fedora-$(rpm -E %fedora).repo && \

#RUN	curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo && \
#	sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
#	rpm-ostree install system76-scheduler gnome-shell-extension-system76-scheduler && \
#	sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
#	curl -Lo /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-$(rpm -E %fedora)/atim-heroic-games-launcher-fedora-$(rpm -E %fedora).repo && \
#	sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo && \
#	rpm-ostree install heroic-games-launcher-bin && \
#	sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo && \
#	curl -Lo /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora)/cboxdoerfer-fsearch-fedora-$(rpm -E %fedora).repo && \
#	sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo && \
#	rpm-ostree install fsearch && \
#	sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo && \
#	sed -i 's@enabled=0@enabled=1@g' /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
#	rpm-ostree install steam mangohud && \
#	sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/rpmfusion-nonfree-steam.repo && \
#	rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN	curl -Lo /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo && \
	curl -Lo /etc/yum.repos.d/_copr_atim-heroic-games-launcher.repo https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-$(rpm -E %fedora)/atim-heroic-games-launcher-fedora-$(rpm -E %fedora).repo && \
	curl -Lo /etc/yum.repos.d/_copr_cboxdoerfer-fsearch.repo https://copr.fedorainfracloud.org/coprs/cboxdoerfer/fsearch/repo/fedora-$(rpm -E %fedora)/cboxdoerfer-fsearch-fedora-$(rpm -E %fedora).repo && \
	rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	
RUN	rpm-ostree install system76-scheduler gnome-shell-extension-system76-scheduler && \
	rpm-ostree install heroic-games-launcher-bin && \
	rpm-ostree install fsearch && \
	rpm-ostree install steam mangohud

### Drivers & Codecs
RUN	rpm-ostree override remove \
		mesa-va-drivers \
		noopenh264 \
		libavcodec-free \
		libavfilter-free \
		libavformat-free \
		libavutil-free \
		libpostproc-free \
		libswresample-free \
		libswscale-free && \
	rpm-ostree install \
		mesa-va-drivers-freeworld \
		mesa-vdpau-drivers-freeworld \
		openh264 \
		mozilla-openh264 \
		gstreamer1-libav \
		gstreamer1-plugin-openh264 \
		gstreamer1-vaapi \
		gstreamer1-plugins-bad-freeworld \
		gstreamer1-plugins-ugly

### Necesities
RUN	rpm-ostree install \
		distrobox \
		adw-gtk3-theme \
		gnome-shell-extension-caffeine \
		gnome-shell-extension-dash-to-dock \
		ffmpegthumbnailer \
		gnome-console \
		gnome-calculator \
		gnome-calendar \
		gnome-text-editor \
		file-roller \
		evince \
		loupe \
		gthumb \
		transmission fragments \
		celluloid g4music cozy \
		ibm-plex-mono-fonts \
		ibm-plex-sans-fonts \
		ibm-plex-serif-fonts \
		adobe-source-serif-pro-fonts \
		adobe-source-sans-pro-fonts \
		rsms-inter-fonts \
		cascadia-code-fonts

### Virt-Manager
RUN	rpm-ostree install virt-manager virt-install virt-viewer libvirt && rpm-ostree cleanup -m

### Debloat
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
		gnome-terminal gnome-terminal-nautilus && \
	rpm-ostree cleanup -m

### Finish
COPY rootfs/ /
RUN	fc-cache -f /usr/share/fonts/ && \
	systemctl enable com.system76.Scheduler.service && \
	systemctl enable libvirtd.service && \
	systemctl enable rpm-ostreed-automatic.timer && \
	systemctl enable flatpak-update.service && \
	systemctl enable flatpak-update.timer && \
	systemctl enable dconf-update.service && \
	sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
	sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
	git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com
	wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d
