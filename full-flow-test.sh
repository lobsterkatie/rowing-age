# source prepare-test.sh
# source zeus-upload.sh
# source publish-test.sh

# export CRAFT_LOG_LEVEL=debug
source ignored/craft-env.sh
# LOCAL_CRAFT="./node_modules/\@sentry/craft/dist/index.js"

echo "RUNNING CRAFT PREPARE"
git branch -D release/1.0.1
git push origin --delete release/1.0.1
node ./node_modules/\@sentry/craft/dist/index.js prepare 1.0.1

echo "MAKING FIRST ZEUS JOB"
source ignored/zeus-creds.sh

SHA=$(git rev-parse HEAD)
BUILD=$RANDOM
echo "git SHA is $SHA"
echo "build number is $BUILD"
zeus job update --build=$BUILD --job=1 --ref=$SHA

echo "TAKING A BRIEF NAP"
sleep 30

echo "MAKING SECOND ZEUS JOB"
# SHA=$(git rev-parse HEAD)
BUILD=$RANDOM
echo "git SHA is $SHA"
echo "build number is $BUILD"
zeus job update --build=$BUILD --job=1 --ref=$SHA

echo "UPLOADING STUFF TO ZEUS"
zeus upload --build=$BUILD --job=1 testdoc.txt

source ignored/gcs-creds.sh
unset ZEUS_TOKEN

echo
echo "EMPTYING BUCKET"
gsutil rm -r gs://craft-test-artifacts/1.0.1/*
echo
echo "CURRENT CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts/1.0.1
echo

echo "RUNNING CRAFT PUBLISH"

# SHA=$(git rev-parse HEAD)

node ./node_modules/\@sentry/craft/dist/index.js publish --no-status-check --no-input 1.0.1 --rev $SHA

echo
echo "NEW CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts/1.0.1
echo
