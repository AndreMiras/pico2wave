# builds nanotts for Heroku and upload it to transfer.sh
cd /tmp/
wget -c 'https://github.com/gmn/nanotts/archive/master.zip'
unzip master.zip
mv Makefile.patch /tmp/nanotts-master/
cd /tmp/nanotts-master/
patch < Makefile.patch
make
# prepares the directory structure so that
# heroku-buildpack-vendorbinaries extracts it to:
# /app/.apt/usr/bin/
# which is already part of the PATH, probably thanks to
# heroku-buildpack-apt
mkdir -p .apt/usr/bin/
mv nanotts .apt/usr/bin/
tar -cvzf nanotts.tar.gz .apt/
curl --upload-file nanotts.tar.gz https://transfer.sh/
