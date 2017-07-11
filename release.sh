# Ensure git flow exist
command -v git-flow >/dev/null 2>&1 || brew install git-flow-avh

# Tag me
tag=$1
tag=${tag:-$(date +%s)}
echo $tag > ./msg.tmp

# Start release
git checkout develop
git push
git flow release start $tag
git flow release finish -m $tag $tag
git checkout master
git push
git checkout develop
git push
git branch -d release/$tag