source ignored/gcs-creds.sh
unset ZEUS_TOKEN

echo
echo "CURRENT CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts
echo

echo "RUNNING CRAFT PUBLISH"
# craft publish --no-status-check $1
# ./node_modules/.bin/craft publish --no-status-check --no-input 1.0.1 --rev 38421686a7fdcee3cf984dd19a0dd13c2d05f98e
# npm run craft publish --no-status-check --no-input 1.0.1
craft publish --no-status-check --no-input 1.0.1 --rev $(git rev-parse release/1.0.1)

echo
echo "NEW CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts
echo
