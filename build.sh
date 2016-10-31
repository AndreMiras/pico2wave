# builds nanotts for Heroku
cd /tmp/
wget -c 'https://github.com/gmn/nanotts/archive/master.zip'
unzip master.zip
cd /tmp/nanotts-master/
patch < Makefile.patch
make
