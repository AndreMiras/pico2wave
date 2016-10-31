# builds nanotts for Heroku and upload it to transfer.sh
cd /tmp/
wget -c 'https://github.com/gmn/nanotts/archive/master.zip'
unzip master.zip
cd /tmp/nanotts-master/
patch < Makefile.patch
make
# prepares the directory structure so that
# heroku-buildpack-vendorbinaries extracts it to:
# /app/.heroku/python/bin/
# which is already part of the PATH
mkdir -p .heroku/python/bin/
mv nanotts .heroku/python/bin/
curl --upload-file ./nanotts.tar.gz https://transfer.sh/
