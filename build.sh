# builds nanotts for Heroku and upload it to transfer.sh
cd /tmp/
wget -c 'https://github.com/gmn/nanotts/archive/master.zip'
unzip master.zip
cd /tmp/nanotts-master/
patch < Makefile.patch
make
curl --upload-file ./nanotts https://transfer.sh/
