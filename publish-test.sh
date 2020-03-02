echo
echo "CURRENT CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts
echo

echo "RUNNING CRAFT PUBLISH"
craft publish $1

echo
echo "NEW CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts
echo
