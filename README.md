# pi-picture-frame

1. [Download and install RaspberryPi Lite OS to an SD Card](https://www.raspberrypi.org/software/)
1. Boot the pi and login (pi/raspberry)
1. Run `sudo raspi-config` and setup wifi under "System Options" -> "Wireless LAN", choose yes to reboot
1. Run `sudo apt update && sudo apt upgrade`
1. Run `sudo apt install xorg feh rpd-plym-splash`
1. Run `sudo systemctl enable autologin@.service`
1. Open `/etc/plymouth/plymouthd.conf` and update `Theme=pix` to `Theme=tribar`
1. Run `sudo raspi-config` and enable the splashscreen under "System Options" -> "Splash Screen"
1. Open `/home/pi/.profile` and update it to run `startx` if `$(tty) == "/dev/tty1"`, it should end up looking something like [./profile](./profile)
1. Find some way to download your pictures to /home/pi/pictures (I used [./downloadPictures.sh](./downloadPictures.sh) and set it up to run daily using cron
