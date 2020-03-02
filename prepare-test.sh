git branch -D release/1.0.1
git push origin --delete release/1.0.1

echo "RUNNING CRAFT PREPARE"
# craft prepare $1
craft prepare 1.0.1

echo "UPLOADING STUFF TO ZEUS"
source ignored/zeus-creds.sh
# NOW=$(date +"%r")
# echo -e "\n$2 - zeus upload" >>testdoc.txt
# echo $NOW >>testdoc.txt

zeus job update --build 1 --job 1 --ref $(git rev-parse HEAD)
zeus upload --build 1 --job 1 testdoc.txt
