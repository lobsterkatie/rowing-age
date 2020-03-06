git branch -D release/1.0.1
git push origin --delete release/1.0.1

echo "RUNNING CRAFT PREPARE"
export CRAFT_LOG_LEVEL=debug
# craft prepare $1
craft prepare 1.0.1
