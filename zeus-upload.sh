echo "UPLOADING STUFF TO ZEUS"
source ignored/zeus-creds.sh

source zeus-make-build.sh
sleep 30
# source zeus-make-build.sh
zeus upload --build=$BUILD --job=1 testdoc.txt
