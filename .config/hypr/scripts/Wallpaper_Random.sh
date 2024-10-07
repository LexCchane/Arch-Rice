#!/bin/bash

pkill waybar
pkill mpvpaper

wallDIR="$HOME/Wallpaper/"
INDEX_FILE="$HOME/.wallpaper_index"

# Read the current index from the index file, defaulting to 0 if the file doesn't exist
CURRENT_INDEX=0
if [[ -f "$INDEX_FILE" ]]; then
    CURRENT_INDEX=$(<"$INDEX_FILE")
fi

# Get a list of image files in the directory
PICS=($(find "$wallDIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))

# Calculate the next index by incrementing the current index
NEXT_INDEX=$(( ($CURRENT_INDEX + 1) % ${#PICS[@]} ))

# Set the wallpaper using the next image in the list
# Replace the following line with your actual command to set the wallpaper
# Example: set_wallpaper_command "${PICS[NEXT_INDEX]}"
echo swww query || swww-daemon && swww img -t none "${PICS[NEXT_INDEX]}"

# Save the next index back to the index file for the next run
echo "$NEXT_INDEX" > "$INDEX_FILE"

# Set the color scheme based on the new wallpaper
# Ensure the 'wal' command is installed and callable
wal -i "${PICS[NEXT_INDEX]}"

# Restart Waybar
waybar
