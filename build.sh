# builds nanotts for Heroku
wget --continue 'https://github.com/gmn/nanotts/archive/master.zip'
unzip master.zip -d /tmp/
patch -d /tmp/nanotts-master/ < Makefile.patch
cd /tmp/nanotts-master/
make
