#!/bin/bash

path='$PATH'
home='$HOME'
folder=`dirname $BASH_SOURCE`
full="$HOME/$folder"
append="PATH=$home/$folder:$path"
if ! grep -q $append "$HOME/.bash_profile"; then
	echo $append >> $HOME/.bash_profile
	. $HOME/.bash_profile
fi
for filename in $full/*.sh; do
	chmod +x $filename
done