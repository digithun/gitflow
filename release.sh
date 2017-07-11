tag=${$1:-$(date +%s)}
echo $tag > ./msg.tmp

git-flow release start $tag
git-flow release finish -f ./msg.tmp $tag
git checkout master
git push
git checkout develop
git push
git branch -d release/$tag