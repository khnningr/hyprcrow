#!/bin/bash

function habilitar_plugins
{

sudo pacman -S --needed cpio meson cmake
hyprpm update

}

function habilitar_hyprexpo
{

hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable hyprexpo

}

function habilitar_hyprspace
{

hyprpm add https://github.com/KZDKM/Hyprspace
hyprpm enable Hyprspace

}