#!/bin/bash
if [[$(xrandr | grep 'HDMI-1') == 'HDMI-1 connected (normal left inverted right x axis y axis)']]; then
	exec 'xrandr --output HDMI-1 auto; xrandr --output eDP-1 off'
else
	exec 'xrandr --output eDP-1 auto; xrandr --output HDMI-1 off;'
fi

