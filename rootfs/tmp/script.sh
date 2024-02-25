#!/bin/bash

gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.shell enabled-extensions "['caffeine@patapon.info']"
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
gsettings set org.gnome.nautilus.preferences default-sort-order 'name'
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified']"

flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'

git clone https://github.com/somepaulo/MoreWaita.git ~/.local/share/icons/MoreWaita
gsettings set org.gnome.desktop.interface icon-theme 'MoreWaita'

gsettings set org.gnome.desktop.interface font-name 'SF Pro Display 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'SF Mono 12'
gsettings set org.gnome.desktop.interface document-font-name 'New York 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'SF Pro Display 10'

mkdir -p /usr/local/share
ln -s /usr/share/fonts /usr/local/share
fc-cache