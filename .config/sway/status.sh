#!/bin/sh

date_formatted=$(date "+%Y-%m-%d %k:%M")
# sometimes status is unknown
battery_status1=$(cat /sys/class/power_supply/BAT0/status)
battery_status2=$(cat /sys/class/power_supply/BAT0/capacity)
# why doesn't this double?
volume=$(pactl get-sink-volume 0 | grep -Eo "[0-9]+\%" | head -1)

echo "$volume | $battery_status1 $battery_status2% | $date_formatted"
