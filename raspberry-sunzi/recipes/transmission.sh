# source: http://blog.snapdragon.cc/raspberry-pi-as-bittorrent-server/

# Installs all components needed for a nice seedbox on your new raspberry pi.
# Base image: http://www.linuxsystems.it/2012/06/debian-wheezy-raspberry-pi-minimal-image/
# Prepared by manu (at) snapdragon.cc

if dpkg -s "transmission-daemon"; then
  echo 'Transmission already installed'
else
  apt-get -y install transmission-daemon

  service transmission-daemon stop
  sed -i -re 's/(rpc-authentication-required\":\ )([a-z]+)*/\1false/g' /etc/transmission-daemon/settings.json
  sed -i -re 's/(rpc-whitelist-enabled\":\ )([a-z]+)*/\1false/g' /etc/transmission-daemon/settings.json
  sed -i -re 's/(download-dir\":\ )([a-z]+)*(.*)/\1\"\/srv\/media\",/g' /etc/transmission-daemon/settings.json
  service transmission-daemon start

  mkdir /media/
  chown debian-transmission /srv/media
fi
