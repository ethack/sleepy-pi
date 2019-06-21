
This repository contains the configuration and scripts for a Raspberry Pi used as a sleep aid for children. 

* Any speaker plugged in will output white noise and the configuration supports either continually playing white noise (e.g. if you plug/unplug the speaker whenever you want/don't want noise) or only playing noise on a schedule (e.g. if you leave the speaker plugged in all the time but want the noise to only run certain times of day).
* You can also control the green LED on the Raspberry Pi. This is meant to be an indication to the child of something (e.g. only get out of bed when the light is on). This currently isn't very useful as: 1) the green LED is tiny and hard to see when the RPi is in a case, 2) the red LED right next to it can only be turned off on RPi v2+ and I'm currently using a v1.
* Set the RPi up as an Airplay receiver using shairplay-sync. This isn't very useful when the white noise is running.

# Repository Structure Explanation

* boot/ - directory meant to be used with Rasbian
	* ssh - empty file to enable SSH server on boot
	* wpa_supplicant.conf - change ssid and passphrase to enable wifi on boot
* /etc/cron.d
	* light - schedule for running light.sh
	* noise - schedule for running noise.sh
* light.sh - script to turn the pi LED on/off
* noise.sh - script to play noise (brown + pink) for a period of time

# Installation

```bash
# Install dependencies
sudo apt-get update && sudo apt-get -y install sox git shairport-sync

# Download the sleepy-pi repo
sudo mkdir -p /opt/sleepy-pi && sudo git clone https://github.com/ethack/sleepy-pi /opt/sleepy-pi

# Install the cron schedules and set the timezone
sudo ln -s /opt/sleepy-pi/etc/cron.d/light /etc/cron.d/light
sudo ln -s /opt/sleepy-pi/etc/cron.d/noise /etc/cron.d/noise
sudo rm -f /etc/localtime && sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
# Restart cron to ensure new timezone takes effect
sudo systemctl restart cron
```

# Update

```bash
(cd /opt/sleepy-pi && sudo git pull)
```

## Airplay Resouces
* https://gist.github.com/connorjan/984e6285d6c96abc807e6b0eb5724b82
* https://pimylifeup.com/raspberry-pi-airplay-receiver/
* http://www.raspberry-pi-geek.com/Archive/2015/09/Using-the-Raspberry-Pi-as-an-AirPlay-server

Note that both shairplay and shairport-sync are in the Rasbian package repository and you don't need to install either one from source.

## TODO
* https://hackaday.com/2019/04/08/give-your-raspberry-pi-sd-card-a-break-log-to-ram/
