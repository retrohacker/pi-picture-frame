# pi-picture-frame

1. [Download and install RaspberryPi Lite OS to an SD Card](https://www.raspberrypi.org/software/)
1. Boot the pi and login (pi/raspberry)
1. Run `sudo raspi-config` and setup wifi under "System Options" -> "Wireless LAN", choose yes to reboot
1. Run `sudo raspi-config` and set the hostname to `pictureframe` under "System Options" -> "Hostname"
1. Run `sudo apt update && sudo apt upgrade`
1. Run `sudo apt install xorg feh rpd-plym-splash`
1. Run `sudo systemctl enable autologin@.service`
1. Open `/etc/plymouth/plymouthd.conf` and update `Theme=pix` to `Theme=tribar`
1. Open `/boot/config.txt` and uncomment `disable_overscan=1`
1. Run `sudo raspi-config` and enable the splashscreen under "System Options" -> "Splash Screen"
1. Open `/home/pi/.profile` and update it to run `startx` if `$(tty) == "/dev/tty1"`, it should end up looking something like [./profile](./profile)
1. Find some way to download your pictures to /home/pi/pictures (I used [./downloadPictures.sh](./downloadPictures.sh) and set it up to run daily using cron)
1. Setup a script to display your images using feh, I used [./slideshow.sh](./slideshow.sh)
1. Open up `.xinitrc` and run your script, for example mine is `exec /home/pi/slideshow.sh`

These next steps are optional. I'm giving the picture frames away as a gift to family in another state and I want to be able to fix them over something like teamviewer if something goes wrong.
1. Run `passwd` to change the password to something more secure (I use [diceware](https://www.rempe.us/diceware/#eff))
1. Run `sudo raspi-config` and enable ssh under "Interface Options" -> "SSH"
