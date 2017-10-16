#!/bin/bash

echo -e "Enter username for Django admin:"
read djangouser
echo -e "Enter email for Django admin:"
read djangoemail
match="false"
pass1="1"
pass2="2"
while [ "$match" = "false" ]; do
	echo -e "Enter password for Django admin:"
	read pass1
	echo -e "Enter password for Django admin (again):"
	read pass2
	if [ "$pass1" = "$pass2" ]; then
		match="true"
	else
		echo -e "Passwords don't match, please try again"
	fi
done
echo "from django.contrib.auth.models import User; User.objects.filter(email='$djangoemail').delete(); User.objects.create_superuser('$djangouser', '$djangoemail', '$pass1')" | python manage.py shell