#!/bin/bash

cd $HOME
echo "Enter Version Number #.#.#:"
read version
if grep -q 'PATH=$HOME/opt/python-${version}/bin:$PATH' .bash_profile; then
	echo "Python $version Already Found."
else
	wget https://www.python.org/ftp/python/${version}/Python-${version}.tgz
	tar xvf Python-${version}.tgz
	cd Python-${version}
	./configure --prefix=$HOME/opt/python-${version}
	make && make install
	cd $HOME
	echo -e "PATH=\$HOME/opt/python-${version}/bin:\$PATH" >> .bash_profile
	. .bash_profile
	echo "Python $version Installed! Cleaning files..."
	rm -rf Python-${version}
	rm Python-${version}.tgz
	echo "Done!"
fi
