#!/usr/bin/env bash

sleep 1

# Kill all possible running xdg-desktop-portals
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-lxqt
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal-termfilechooser
killall xdg-desktop-portal
sleep 1

# Start xdg-desktop-portal-hyprland
/usr/lib/xdg-desktop-portal-hyprland &
sleep 2

# /usr/lib/xdg-desktop-portal-termfilechooser -r &
# sleep 2

# Start xdg-desktop-portal
/usr/lib/xdg-desktop-portal &
sleep 1
