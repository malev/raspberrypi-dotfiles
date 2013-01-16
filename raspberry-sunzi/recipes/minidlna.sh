# MiniDLNA
# Source: http://www.senab.co.uk/2012/06/09/raspberry-pi-media-server-pt-1/
# https://help.ubuntu.com/community/MiniDLNA

if dpkg -s "minidlna"; then
  echo 'minidlna already installed'
else
  apt-get -y install minidlna

  # Backup the original config so you can refer it later
  cp /etc/minidlna.conf /etc/minidlna.conf.default

  sed -i '/media_dir=\/var\/lib\/minidlna/d' /etc/minidlna.conf
  mkdir -p /media/usbhdd/music
  mkdir -p /media/usbhdd/downloads/complete
  mkdir -p /media/usbhdd/photos
  ln -sf /media/usbhdd/music /home/pi/music
  ln -sf /media/usbhdd/downloads/complete /home/pi/videos
  ln -sf /media/usbhdd/photos /home/pi/photos
  echo "media_dir=A,/home/pi/music" >> /etc/minidlna.conf
  echo "media_dir=V,/home/pi/videos" >> /etc/minidlna.conf
  echo "media_dir=P,/home/pi/photos" >> /etc/minidlna.conf
  echo "db_dir=/home/pi/.minidlna" >> /etc/minidlna.conf
  echo "log_dir=/var/log" >> /etc/minidlna.conf
  echo "inotify=yes" >> /etc/minidlna.conf
  echo "notify_interval=895" >> /etc/minidlna.conf

  mkdir /home/pi/.minidlna
  chmod 777 .minidlna

  # Start MiniDLNA at boot
  update-rc.d minidlna defaults
  # Start MiniDLNA now
  service minidlna start
fi
