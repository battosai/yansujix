# **鹽酥雞X**

Personal notes of my Arch Linux experience

## Installation
[Official Guide](https://wiki.archlinux.org/title/Installation_guide)

[Reference Video 1](https://www.youtube.com/watch?v=YC7NMbl4goo) includes encryption and LVM

[Reference Video 2](https://www.youtube.com/watch?v=68z11VAYMS8) easy basic guide

- Get an ISO of Arch off the [official downloads page](https://archlinux.org/download/)
- Download [Rufus](https://rufus.ie/en/) (or some other program that does the same thing) and format a USB with the ISO file
- Boot up using the bootable USB on your target machine (I had to press F12 during bootup to access the boot menu)
   - May have to disable UEFI Secure Boot
- Connect to WiFi using ```iwctl```
  - ```device list``` to get the name of your wireless device (if you have a wireless adapter)
  - ```station <wireless_device_name> connect <wifi_network_name>```
  - enter password if needed
  - ```ping archlinux.org``` to test the connection
- Update system clock ```timedatectl set-timezone America/New_York```
- Wipe drives with random data: ```dd if=/dev/urandom of=<device_name> bs=4096 status=progress```
- Partition your drives with: ```cfdisk /dev/<drive_name>```
   - ssd: 1G for /boot, 4G for swap, the rest for "/" which is /home (?)
   - separate hdd as a single partition that I'll use for storage
- Format the partitions (ssd & hdd)
- Mount the partitions
- Install packages ```pacstrap -K /mnt base linux linux-firmware```
  - other packages ```pacstrap -K /mnt vim base-devel sof-firmware grub efibootmgr intel-ucode networkmanager iwd```
  - [NetworkManager needs to be configured to use iwd for wireless](https://wiki.archlinux.org/title/NetworkManager#Using_iwd_as_the_Wi-Fi_backend) (Do this step once you've changed root into the installed system)
- fstab that shit (also do it for the other hdd, it all goes to /mnt/etc/fstab
  - ```genfstab /mnt > /mnt/etc/fstab``` to move the fstab file into our disk
  - can also do the other hdd post-installation, you just manually modify the /etc/fstab file
- chroot into the installed system ```arch-chroot /mnt```
- When installing the bootloader (grub), I used the cmd from the first reference video
  - ```grub-install --efi-directory=/boot```
- to be continued... follow the reference videos and official guide :)

## Hyprland Setup
- Install hyprland ```sudo pacman -S hyprland```
- Install some [must-haves](https://wiki.hyprland.org/Useful-Utilities/Must-have/)
  - Only did these so far ```sudo pacman -S swaync pipewire wireplumber hyprpolkitagent qt5-wayland qt6-wayland```
- Install bare necessities ```sudo pacman -S firefox kitty```
  - Default hotkeys are SUPER+Q for terminal
  - In hyprland config, update/add program used for...
    - ```$terminal = kitty```
    - ```$browser = firefox```
- Automatically boot into hyprland by adding this to ~/.bash_profile
  ```
  if uwsm check may-start; then
     exec uwsm start hyprland.desktop
  fi
  ```
- If things seem a little too large, could be the [monitor scaling](https://wiki.hyprland.org/Configuring/Monitors/)
  - ```hyprctl monitors all``` to get monitor info
  - In hyprland config, update monitor section to be ```monitor = eDP-1, 1920x1080@60, 0x0, 1```
- Install an app launcher ```sudo pacman -S rofi-wayland```
  - In hyprland config, update program used for ```$menu = rofi -show drun```
- Install brightnessctl ```sudo pacman -S brightnessctl``` to control brightness
- Install sound ```sudo pacman -S pipewire && pipewire-audio``` and reboot

## General Setup
- To see Chinese/Japanese/Korean characters, install noto-fonts ```sudo pacman -S noto-fonts noto-fonts-cjk```
- To see Unicode characters, install a [Nerd-patched Font](https://www.nerdfonts.com/)
  - Kitty has fonts patched innately so some characters may be visible there but nowhere else if an actual font is not installed
- Setting up git ```sudo pacman -S git```
  - Install openssh in order to use ssh-keygen for ssh keys in git
  - ```sudo pacman -S openssh```
  - Had to start an ssh-agent in .bashrc on boot (so that we don't have to manually start one)
  - Created an ssh config (```~/.ssh/config```) to add identity and key to agent
- Screenshots ```sudo pacman -S grim slurp tee```
  - ```grim``` is for general [screenshotting](https://man.archlinux.org/man/extra/grim/grim.1.en)
  - ```slurp``` is for [region selection](https://man.archlinux.org/man/slurp.1)
  - ```tee``` is for saving to standard [files](https://wiki.archlinux.org/title/Screen_capture)
    - I'm unsure if this is installed by default, I didn't have to explicitly install it, but it might have been a dependency of something else
    - Additionally, unsure if this is explicitly needed since you can specify a file path and name with just ```grim```
- Image Viewing
  - ```xdg-open <file-path>``` is installed by default and opens files in browsers
- TUI File Manager [yazi](https://yazi-rs.github.io/docs/installation/)
