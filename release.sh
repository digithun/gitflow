tag=$1
tag=${tag:-$(date +%s)}
echo $tag > ./msg.tmp

git checkout develop
git-flow release start $tag
git-flow release finish -f ./msg.tmp $tag
git checkout master
git push
git checkout develop
git push
git branch -d release/$tag