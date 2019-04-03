#!/bin/bash

# https://www.raspberrypi.org/forums/viewtopic.php?t=12530
if [ "$1" = "off" ]; then
	echo 0 | sudo tee /sys/class/leds/led0/brightness
elif [ "$1" = "on" ]; then
	echo 1 | sudo tee /sys/class/leds/led0/brightness
fi