#!/bin/bash
### Example of a version-bumping script for an NPM project.
### Located at: scripts/bump-version.sh

# # helps with debugging
# set -eux

# # ${1} is argv[1]
# OLD_VERSION="${1}"
# NEW_VERSION="${2}"

# # Do not tag and commit changes made by "npm version"
# export npm_config_git_tag_version=false

# # bump the version in package.json and package-lock.json
# npm version "${NEW_VERSION}"

echo "VERSION BUMP WOULD HAPPEN HERE"
NOW=$(date +"%r")
echo -e "\n$2 - craft prepare" >>testdoc.txt
echo $NOW >>testdoc.txt
echo

echo "UPLOADING STUFF TO ZEUS"
source ignored/zeus-creds.sh

SHA=$(git rev-parse HEAD)
# BUILD=$(git log --oneline | wc -l)
export BUILD=$(($BUILD + 1))
echo "git SHA of release branch head is $SHA"
echo "build number is $BUILD"

zeus job update --build $BUILD --job 1 --ref $SHA
zeus upload --build $BUILD --job 1 testdoc.txt

# echo "CURRENT CONTENTS OF BUCKET"
# gsutil ls gs://craft-test-artifacts
# echo
