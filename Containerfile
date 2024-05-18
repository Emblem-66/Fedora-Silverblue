FROM quay.io/fedora/fedora-silverblue:latest

# DEBLOAT
RUN rm -r /usr/lib/fedora-third-party && \
	rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo && \
	rm /etc/yum.repos.d/fedora-cisco-openh264.repo && \
	rm /etc/yum.repos.d/google-chrome.repo && \
	rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo && \
	rm /etc/yum.repos.d/fedora-updates-archive.repo && \
	rpm-ostree override remove \
		toolbox \
		yelp yelp-xsl yelp-libs \
		gnome-tour \
		gnome-shell-extension-apps-menu \
		gnome-shell-extension-launch-new-instance \
		gnome-shell-extension-places-menu \
		gnome-shell-extension-window-list \
		gnome-shell-extension-background-logo \
		gnome-classic-session \
gnome-classic-session-xsession \
		firefox firefox-langpacks

# REPOS
RUN wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

# GNOME
RUN git clone https://github.com/somepaulo/MoreWaita.git /usr/share/icons/MoreWaita && \
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com && \
	rpm-ostree install adw-gtk3-theme gnome-shell-extension-caffeine

# System76 Scheduler
RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo && \
	rpm-ostree install system76-scheduler gnome-shell-extension-system76-scheduler && \
	systemctl enable com.system76.Scheduler.service

# IINPUT REMMAPER
RUN rpm-ostree install input-remapper && \
	systemctl enable input-remapper

# VIRT-MANAGER
RUN rpm-ostree install virt-manager && \
	systemctl enable libvirtd.service

# FONTS
RUN rpm-ostree install \
		ibm-plex-mono-fonts ibm-plex-sans-fonts ibm-plex-serif-fonts \
		adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts \
		sorkintype-merriweather-fonts sorkintype-merriweather-sans-fonts \
		mozilla-fira-mono-fonts mozilla-fira-sans-fonts mozilla-zilla-slab-fonts \
		lato-fonts \
		rsms-inter-fonts \
		levien-inconsolata-fonts \
		jetbrains-mono-fonts \
		cascadia-code-fonts

# CONFIGS
COPY rootfs/ /
RUN systemctl enable rpm-ostreed-automatic.timer && \
	systemctl enable flatpak-update.service && \
	systemctl enable flatpak-update.timer && \
	systemctl enable dconf-update.service && \
	sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
	sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
	fc-cache -f /usr/share/fonts/

# CLEANUP
RUN rpm-ostree cleanup -m && rm -rf /var/* /tmp/*
