#!/bin/bash

path='$PATH'
prof="PATH=`dirname $BASH_SOURCE`:$path"
if ! grep -q $prof "$HOME/.bash_profile"; then
	echo $prof >> $HOME/.bash_profile
	. $HOME/.bash_profile
fi
for filename in ./*.sh; do
	chmod +x $filename
done