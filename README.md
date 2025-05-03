# **yansujix**

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
- Partition your drives with "cfdisk <drive_name>"
   - ssd: 1G for /boot, 4G for swap, the rest for "/" which is /home (?)
   - separate hdd as a single partition that I'll use for storage
- Format the partitions (ssd & hdd)
- Mount the partitions
- Install packages ```pacstrap -K /mnt base linux linux-firmware```
  - other packages: ```pacstrap -K /mnt vim base-devel sof-firmware grub efibootmgr intel-ucode networkmanager iwd```
  - [NetworkManager needs to be configured to use iwd for wireless](https://wiki.archlinux.org/title/NetworkManager#Using_iwd_as_the_Wi-Fi_backend)
- fstab that shit (also do it for the other hdd, it all goes to /mnt/etc/fstab
  - can also do the other hdd post-installation, you just manually modify the /etc/fstab file
- to be continued... follow the reference videos :)
