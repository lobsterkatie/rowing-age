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
echo $NOW >>testdoc.txt
echo
echo "CURRENT CONTENTS OF BUCKET"
gsutil ls gs://craft-test-artifacts
echo
