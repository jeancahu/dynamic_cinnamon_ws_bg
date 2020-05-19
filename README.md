## How to use

Open a terminal and then verify if the directory .user_backgrounds/ already exists in your _home_, when you want to set some background image to a specific workspace you can copy the image to the backgrounds directory:

	cp /path/to/the/image/example.jpg /home/mintuser/.user_backgrounds/ws_3_background

This command will clone your image in the backgrounds directory with the name _ws\_3\_background_, the daemon routine try to set the images with these names for each workspace number. Now you only need to run the daemon script in background, you could use _GNU screen_:

	screen -d -m -S 'dynamic backgrounds' bash ./daemon.sh

