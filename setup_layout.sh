#!/bin/bash
# Wait for the GUI to load completely
sleep 2

# Open terminal
xfce4-terminal &

# Give it a moment to start
sleep 1

# Move the terminal window to the right half of the screen
wmctrl -r "Terminal" -e 0,960,0,960,1080  # Assumes 1920x1080 resolution
