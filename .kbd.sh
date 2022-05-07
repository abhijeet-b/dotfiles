#!/bin/bash

if [[ $(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}') = *us* ]]; then 
	setxkbmap de
else
	setxkbmap us
fi
