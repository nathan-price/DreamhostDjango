# DreamhostDjango
### Start a new Django website on Dreamhost with a single command!

## Prerequisites:
1. A Dreamhost account with hosting plan
2. The ability to ssh into your Dreamhost server

   [(If you are on Windows I recommend using Bitvise SSH Client)](https://www.bitvise.com/ssh-client-download)
   
3. A fully hosted domain/subdomain **with Passenger enabled**
4. A MySQL Database (found in Goodies > MySQL Databases)

   Make sure you know the hostname for database (the url), as well as the name of the database, and a username and password with access to the database.

## First-time Setup
These steps only need to be done once per user:
1. SSH into your dreamhost server
2. Clone this repository
> git clone https://github.com/nathan-price/DreamhostDjango.git
3. Run the setup script (this adds the folder to your PATH)
> . DreamhostDjango/setup.sh
4. Install desired python version (latest version at time of writing is: 3.6.2)
> install-python-version.sh

## Start A Django Project
1. Run the script
> start-django-project.sh

   This will automatically set up your project folders, create and enter a new virtual envirnment, install Django into the envirnment, configure the django settings.py for Dreamhost, and configure Passenger for Django.

## Information
* Activate the virtual environment
> . ~/your_domain/env/bin/activate
* Deactivate the virtual environment
> deactivate
* Static files
> collectstatic.sh
   
   Type this instead of python manage.py collectstatic to avoid the confirmation prompt.
   
* Migrations
> migrate.sh

   This will automatically execute python manage.py makemigrations, followed by python manage.py migrate.
