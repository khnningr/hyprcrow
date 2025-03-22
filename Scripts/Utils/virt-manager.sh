#!/bin/bash

# 
# The software stack that makes up VirGL support is:
#   
#   Guest side:
#     MESA OpenGL driver 
#     Linux kernel VirtIO GPU driver 
#   
#   Host Side:
#     Linux kernel with KVM enabled 
#     QEMU 
#     The GPU hardware and drivers 
#
#
# Controladores para máquinas virtuales:
# sudo pacman -S --needed mesa-git vulkan-virtio lib32-vulkan-virtio
# Nota: Este es el equivalente en Arch Linux.
# Referencia: https://wiki.archlinux.org/title/QEMU#virtio
# 
#
# Guest:
# Fedora:
# sudo dnf install mesa-dri-drivers mesa-vulkan-drivers
# 
#
# 
#
#
#
#
#
#
#
#
