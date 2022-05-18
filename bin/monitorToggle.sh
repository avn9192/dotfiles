!#!/bin/bash

connected=$(xrandr | grep 'HDMI-1 connected')

if [[ -z "$connected" ]]; then
    echo 'Monitor is off'

    xrandr --output HDMI-1 --off
else
    displayed=$(xrandr | grep 'HDMI-1 connected 1920x1080+0+0')

    if [[ -z "$displayed" ]]; then
        echo 'not displayed, enable display'
        xrandr --output HDMI-1 --mode 1920x1080 --pos -1920x0
    else
        echo 'displayed, off display'
        xrandr --output HDMI-1 --off
    fi
fi
