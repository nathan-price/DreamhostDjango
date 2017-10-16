#!/bin/bash

cd $HOME
echo "Enter Domain (your_domain.com)"
read domain
if [ ! -d "$domain" ]; then
	mkdir $domain
fi
cd $domain
if [ ! -d "public" ]; then
	mkdir public
fi
python3 -m venv env
if [ ! -d "public/static" ]; then
	mkdir public/static
fi
. env/bin/activate
PY="$(python -V)"
PY3="$(python3 -V)"
if [ "${PY}" == "${PY3}" ]; then
	echo -e "Env Success."
else
	echo -e "Env Fail."
	exit
fi
pip install django mysqlclient
echo -e "Enter a name to use for the Django project:"
read projectname
django-admin startproject $projectname
cd $projectname/$projectname
sed -i -e "s:ALLOWED_HOSTS = \[\]:ALLOWED_HOSTS = \['$domain'\]:g" settings.py
perl -i -pe "s/'ENGINE'.*'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),/replace_string/g" settings.py
echo -e "STATIC_ROOT = os.path.dirname(BASE_DIR) + '/public/static/'" >> settings.py
echo -e "Enter database name (from dreamhost panel):"
read databasename
echo -e "Enter database username (from dreamhost panel):"
read username
echo -e "Enter database password (from dreamhost panel):"
read password
echo -e "Enter database host url (from dreamhost panel):"
read dhosturl
echo -e "
        'ENGINE': 'django.db.backends.mysql'," > tmp.txt
echo -e "        'NAME': '${databasename}'," >> tmp.txt
echo -e "        'USER': '${username}'," >> tmp.txt
echo -e "        'PASSWORD': '${password}'," >> tmp.txt
echo -e "        'HOST': '${dhosturl}'," >> tmp.txt
echo -e "        'PORT': 3306," >> tmp.txt
perl -0777pi -e "s/\s+'ENGINE':.*?'db.sqlite3'\),/`cat tmp.txt`/s" settings.py
rm tmp.txt
cd ..
cd ..
PYD="python$(python3 -V | grep -oP '\d.\d')"
cp `dirname $BASH_SOURCE`/passenger_wsgi.py passenger_wsgi.py
perl -i -pe "s/{{name}}/$projectname/" passenger_wsgi.py
perl -i -pe "s/{{dir}}/$PYD/" passenger_wsgi.py
if [ ! -d "tmp" ]; then
	mkdir tmp
fi
touch tmp/restart.txt
cp $projectname/$projectname/settings.py tmp/settings.py
cd $projectname
collectstatic.sh
migrate.sh