#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness {
  # xbacklight -get | cut -d '.' -f 1
  brightnessctl g
}

function send_notification {
  icon="preferences-system-brightness-lock"
  brightness=$(get_brightness)
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "󰝤" 0 $((brightness / 10)) | sed 's/[0-9]//g')
  # Send the notification
  brightness_percent=$(($brightness / 4))
  notify-send "brightness: $brightness_percent%" "$bar" -r 5 -i "brightness" -t 1000
}

case $1 in
up)
  # increase the backlight by 5%
  brightnessctl s +5%
  send_notification
  ;;
down)
  # decrease the backlight by 5%
  brightnessctl s 5%-
  send_notification
  ;;
esac
