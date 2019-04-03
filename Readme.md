
# File Explanation

* boot/ - directory meant to be used with Rasbian
	* ssh - empty file to enable SSH server on boot
	* wpa_supplicant.conf - change ssid and passphrase to enable wifi on boot
* /etc/cron.d
	* light - schedule for running light.sh
	* noise - schedule for running noise.sh
* light.sh - script to turn the pi LED on/off
* noise.sh - script to play white(ish) noise (acutally brown + pink)

# Dependencies

```bash
sudo apt-get update
sudo apt-get -y install sox git
sudo mkdir -p /opt/sleepy-pi
sudo git clone https://github.com/ethack/sleepy-pi /opt/sleepy-pi
sudo cp /opt/sleepy-pi/etc/cron.d/* /etc/cron.d/
```

* setup.sh