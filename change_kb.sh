#!/bin/bash

kb=$(grep kb_variant ~/dotFiles/hypr/hyprland.conf | cut -d "=" -f2)
if [ "$kb" == "" ]; then
	if [ "$1" == "false" ]; then
		echo "qwerty - us"
	else
		$(grep -rl kb_variant= ~/dotFiles/hypr/hyprland.conf | xargs sed -i s@kb_variant=@kb_variant=dvorak@g)
		echo "dvorak"
	fi
else
	if [ "$1" == "false" ]; then
		echo "dvorak - us"
	else
		$(grep -rl kb_variant=dvorak ~/dotFiles/hypr/hyprland.conf | xargs sed -i s@kb_variant=dvorak@kb_variant=@g)
		echo "qwerty - us"
	fi
fi
