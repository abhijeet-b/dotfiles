#!/bin/bash
if [[ $(pacmd list-sinks | awk '/muted/ { print $2 }' | awk 'END{print}') = *yes* ]]; then
	echo "muted"
else
	pactl list sinks | awk '$1=="Volume:" {print $5}' | awk 'END{print}' | sed '$s/$/ loud/'
fi

