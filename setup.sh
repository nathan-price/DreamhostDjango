#!/bin/bash

path='$PATH'
folder="PATH=`dirname $BASH_SOURCE`:$path"
prof=`readlink $folder`
if ! grep -q $prof "$HOME/.bash_profile"; then
	echo $prof >> $HOME/.bash_profile
	. $HOME/.bash_profile
fi
for filename in prof/*.sh; do
	chmod +x $filename
done