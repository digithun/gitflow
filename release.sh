tag=$1
msg=$2

tag=${tag:-$(date +%s)}
msg=${msg:-"Release"}
echo $tag $msg

git-flow release start $tag
git-flow release finish $tag -m "hmm"
git checkout master
git push
git checkout develop
git push
git branch -d release/$tag