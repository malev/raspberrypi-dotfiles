# Transmission

The username is transmission and the password is password.

> # apt-get install transmission-cli transmission-common transmission-daemon
> sudo service transmission-daemon stop
> mkdir /home/pi/downloads
> chmod -R 777 /home/pi/downloads
> sudo chmod g+rw /home/pi/downloads
> sudo chgrp -R debian-transmission /home/pi/downloads
> sudo cp settings.json /etc/transmission-daemon/
> sudo service transmission-daemon start


