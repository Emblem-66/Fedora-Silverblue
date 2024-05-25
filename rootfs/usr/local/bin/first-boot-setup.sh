#!/bin/bash

sudo flatpak override --reset
flatpak uninstall --all --delete-data --force-remove -y
sudo flatpak remote-modify --disable fedora
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

mkdir -p ~/HDD1 ~/HDD2 ~/HDD3 ~/SSD1 ~/SSD2
echo "LABEL=HDD1TB /var/home/pc/HDD1 auto nosuid,nodev,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab
echo "LABEL=HDD2TB /var/home/pc/HDD2 auto nosuid,nodev,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab
echo "LABEL=HDD4TB /var/home/pc/HDD3 auto nosuid,nodev,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab
echo "LABEL=SSD1TB /var/home/pc/SSD1 auto nosuid,nodev,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab
echo "LABEL=SSD1TB2 /var/home/pc/SSD2 auto nosuid,nodev,nofail,x-gvfs-show 0 0" | sudo tee -a /etc/fstab
sudo mount -a

cat << EOF > ~/.config/user-dirs.dirs
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/HDD1/Documents"
XDG_MUSIC_DIR="$HOME/HDD1/Music"
XDG_PICTURES_DIR="$HOME/HDD1/Pictures"
XDG_VIDEOS_DIR="$HOME/HDD3/Videos"
EOF

rm -d Documents
rm -d Music
rm -d Pictures
rm -d Videos

cat << EOF > ~/.config/gtk-3.0/bookmarks
file:///var/home/pc/HDD1 HDD1
file:///var/home/pc/HDD2 HDD2
file:///var/home/pc/HDD3 HDD3
file:///var/home/pc/SSD1 SSD1
file:///var/home/pc/SSD2 SSD2
EOF

flatpak install -y org.mozilla.firefox
flatpak run org.mozilla.firefox
curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash
find ~/.var/app/org.mozilla.firefox/.mozilla/firefox -type d -name "*default-release" -exec sh -c 'echo "#TabsToolbar {display: none;}" >> "{}/chrome/userChrome.css"' \;
find ~/.mozilla/firefox -type d -name "*default-release" -exec sh -c 'echo "#TabsToolbar {display: none;}" >> "{}/chrome/userChrome.css"' \;

flatpak install -y \
com.vysp3r.ProtonPlus \
com.github.Matoking.protontricks \
org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08

flatpak override --user --env=MANGOHUD_CONFIG=no_display,position=middle-left,font_size=13,full,fps_limit=60

apps=(
"hu.kramo.Cartridges"
"com.usebottles.bottles"
"com.valvesoftware.Steam"
"com.heroicgameslauncher.hgl"
"org.openmw.OpenMW"
"org.prismlauncher.PrismLauncher"
"eu.vcmi.VCMI"
"com.github.Matoking.protontricks"
)

for app in "${apps[@]}"; do
flatpak install -y "$app"
flatpak override --user --env=MANGOHUD=1 "$app"
flatpak override --user --filesystem=~/SSD2 "$app"
done

flatpak run com.valvesoftware.Steam
git clone https://github.com/tkashkin/Adwaita-for-Steam
cd Adwaita-for-Steam && ./install.py && cd ~ && rm -r -f Adwaita-for-Steam

flatpak install -y \
app.devsuite.Ptyxis \
com.bitwarden.desktop \
com.discordapp.Discord \
com.github.finefindus.eyedropper \
com.github.huluti.Curtail \
com.github.taiko2k.avvie \
com.github.tchx84.Flatseal \
com.github.tenderowl.frog \
com.heroicgameslauncher.hgl \
com.mattjakeman.ExtensionManager \
com.neatdecisions.Detwinner \
de.haeckerfelix.Fragments \
io.github.dvlv.boxbuddyrs \
io.github.seadve.Kooha \
io.github.tfuxu.Halftone \
io.gitlab.adhami3310.Converter \
io.gitlab.adhami3310.Footage \
io.gitlab.theevilskeleton.Upscaler \
net.mediaarea.MediaInfo \
net.mullvad.MullvadBrowser \
net.natesales.Aviator \
org.gnome.gitlab.YaLTeR.Identity \
org.gnome.gitlab.somas.Apostrophe \
org.gnome.meld \
org.jdownloader.JDownloader \
org.kde.krita \
org.localsend.localsend_app \
org.onlyoffice.desktopeditors \
page.codeberg.Imaginer.Imaginer
