#!/bin/bash

# Check for the correct number of arguments
if [ $# -ne 1 ]; then
	echo "Usage: $0 [forward|backward]"
	exit 1
fi

# Get the list of files in the directory (excluding hidden files)
files=($(ls ~/dotFiles/wallpaper -p | grep -v /))

# Filename of current wallpaper img
filename=$(swww query | grep -oE 'image: .*/([^/]+)$' | awk -F '/' '{print $NF}')

current_index=0
for ((i = 0; i < ${#files[@]}; i++)); do
	if [ "${files[i]}" == "$filename" ]; then
		echo "${files[i]}"
		current_index=$i
		break
	fi
done

# Move forward or backward based on the argument
if [ "$1" == "forward" ]; then
	next_index=$(((current_index + 1) % ${#files[@]}))
	next_file="${files[next_index]}"
	swww img ~/dotFiles/wallpaper/$next_file --transition-angle 90 --transition-type wave --transition-step 150 --transition-fps 60 --transition-wave 30,30
elif [ "$1" == "backward" ]; then
	next_index=$(((current_index - 1 + ${#files[@]}) % ${#files[@]}))
	next_file="${files[next_index]}"
	swww img ~/dotFiles/wallpaper/$next_file --transition-angle 270 --transition-type wave --transition-step 150 --transition-fps 60 --transition-wave 30,30

else
	echo "Invalid argument. Use 'forward' or 'backward'."
	exit 1
fi
