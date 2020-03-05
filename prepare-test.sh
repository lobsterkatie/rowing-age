git branch -D release/1.0.1
git push origin --delete release/1.0.1

echo "RUNNING CRAFT PREPARE"
export CRAFT_LOG_LEVEL=debug
# craft prepare $1
craft prepare 1.0.1

# echo "UPLOADING STUFF TO ZEUS"
# source ignored/zeus-creds.sh
# # NOW=$(date +"%r")
# # echo -e "\n$2 - zeus upload" >>testdoc.txt
# # echo $NOW >>testdoc.txt

# SHA=$(git rev-parse release/1.0.1)
# echo "git SHA of release branch head is $SHA"
# zeus job update --build $SHA --job 1 --ref $SHA
# zeus upload --build $SHA --job 1 testdoc.txt

echo "UPLOADING STUFF TO ZEUS"
source ignored/zeus-creds.sh

SHA=$(git rev-parse release/1.0.1)
BUILD=$(git log --oneline | wc -l | sed -E 's/[ ]*(.*)/\1/')
echo "git SHA is $SHA"
echo "build number is $BUILD"

zeus job update --build=$BUILD --job=1 --ref=$SHA
zeus upload --build=$BUILD --job=1 testdoc.txt
