#!/bin/bash

## Depends
# wmctrl
# cinnamon

declare -i CURRENT_WS=$( wmctrl -d | grep '*' | cut -d ' ' -f1 )
declare -i NEW_WS
declare USER_BG_DIR=$HOME/.user_backgrounds

test -d $USER_BG_DIR || mkdir $USER_BG_DIR

if test -r $USER_BG_DIR/ws_0_background
then
    ln -s $USER_BG_DIR/ws_0_background $USER_BG_DIR/default
else
    {
	echo "Introduce the images for each workspace in the directory"
	echo "$HOME/.user_backgrounds/ with the format ws_<number>_background"
	echo -e "example for WS 3: \n\tws_3_background"
    } &>/dev/stderr
    exit 1
fi

## This line link the default background image to our personal backgrounds directory
eval gsettings set org.cinnamon.desktop.background picture-uri "file:///$HOME/.user_backgrounds/default"

function change_bakground_image ()
{
    # $1 the WS number
    BG_IMAGE=$USER_BG_DIR/ws_$1_background
    if test -e $BG_IMAGE
    then
	eval gsettings set org.cinnamon.desktop.background picture-uri "file:///$BG_IMAGE"
    fi
}

# Main pulling rutine
while :
do
    NEW_WS=$( wmctrl -d | grep '*' | cut -d ' ' -f1 )
    if (( CURRENT_WS == NEW_WS ))
    then
	: # We still in the same WS
    else
	# New WS lets change de desktop image
	change_bakground_image $NEW_WS
	let CURRENT_WS=NEW_WS
    fi
done

exit 0
