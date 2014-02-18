#!/bin/bash
#change this to the name of your Starbound-Mod-Script-Folder
bashvar=$(which bash)
Directory=$(pwd)
if [ $(pwd) != '/tmp' ]
then
		cp update.sh /tmp/update.sh
		cd /tmp
		exec $bashvar ./update.sh $Directory
else
	Directory=$1
	echo 'Starting update'
	rm -rf /tmp/StarboundModScript
	git clone https://github.com/herochao/Starbound-Mod-Script.git /tmp/StarboundModScript

	if [ -d StarboundModScript ]
	then
		echo 'Download complete, installing'	
		ls StarboundModScript | xargs -i -d '\n' rm -r "${Directory}/{}"
		mv StarboundModScript/* $Directory/
		echo 'Update complete'
	else
		echo 'Download failed'
	fi
fi
