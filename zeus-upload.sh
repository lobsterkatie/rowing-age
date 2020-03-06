echo "UPLOADING STUFF TO ZEUS"
source ignored/zeus-creds.sh

SHA=$(git rev-parse release/1.0.1)
# SHA=$(git rev-parse HEAD)
# BUILD=$(git log --oneline | wc -l | sed -E 's/[ ]*(.*)/\1/')
BUILD=$RANDOM
echo "git SHA is $SHA"
echo "build number is $BUILD"

zeus job update --build=$BUILD --job=1 --ref=$SHA
zeus upload --build=$BUILD --job=1 testdoc.txt
