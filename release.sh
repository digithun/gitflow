tag=$1
tag=${tag:-$(date +%s)}
echo $tag > ./msg.tmp

git checkout develop
git push
git flow release start $tag
git flow release finish $tag -f ./msg.tmp
rm -f ./msg.tmp
git checkout master
git push
git checkout develop
git push
git branch -d release/$tag