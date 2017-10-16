# DreamhostDjango
### Scripts to automate setting up a Django website on Dreamhost

## Prerequisites:
1. A Dreamhost account with hosting plan
2. The ability to ssh into your Dreamhost server

   [(If you are on Windows I recommend using Bitvise SSH Client)](https://www.bitvise.com/ssh-client-download)
   
3. A fully hosted domain/subdomain **with Passenger enabled**
4. A MySQL Database (found in Goodies > MySQL Databases)

   Make sure you know the hostname for database (the url), as well as the name of the database, and a username and password with access to the database.

## First-time Setup
1. SSH into your dreamhost server
2. Clone this repository
> git clone https://github.com/nathan-price/DreamhostDjango.git
3. Run the setup script (this adds the folder to your PATH)
> . DreamhostDjango/setup.sh
4. Install desired python version (latest version at time of writing is: 3.6.2)
> install-python-version.sh

## Start Django Project
1. Run the script
> start-django-project.sh
