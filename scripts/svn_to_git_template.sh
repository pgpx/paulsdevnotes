#!/usr/bin/env bash

# Template script file to manage migrating an SVN repo to Git

PROJECT=myproject
SVNURL=svn://devsupport/myproject/

#Generate the authors file, and then manually edit it to add full names, then run the rest of the script
#time java -jar svn-migration-scripts.jar authors "$SVNURL" > authors.txt

rm -rf "$PROJECT"
git svn init --stdlayout --prefix="" "$SVNURL" "$PROJECT"
cd "$PROJECT"

# Uncomment to migrate only selected tags (e.g. if others contain build artifacts that you don't want in Git)
#git config --replace-all svn-remote.svn.tags "$PROJECT/tags/{tag1,tag2,tag3}:refs/remotes/tags/*"

# Uncomment to migrate no tags at all
#git config --replace-all svn-remote.svn.tags ''

# Uncomment to migrate no branches at all
#git config --replace-all svn-remote.svn.branches ''

# Might have to skip first empty SVN commit because index-filter will break
# List the first few SVN revisions:  tail svn log "$SVNURL"
# Look into an individual revision to see if it was empty: svn log "$SVNURL"/trunk/ -r 1234
# Replace 1234 with the number of the first revision that contains files (not just directories)
time git svn fetch  --ignore-paths='/trunk/trunk/|/\.idea/|\.iml$|\.ipr$' --authors-file=../authors.txt -q -r 1234:HEAD

# Output the ignore file - can be used as the basis for .gitignore in the new project
git svn show-ignore > "../$PROJECT.ignore.txt"

# Replace modified tag config (because svn-migration-scripts won't understand it)
git config --replace-all svn-remote.svn.tags "$PROJECT/tags/*:refs/remotes/tags/*"

# Use the svn-migration-scripts to clean up the repo
# https://bitbucket.org/atlassian/svn-migration-scripts/src
java -Dfile.encoding=utf-8 -jar ~/Dev/svntogit/svn-migration-scripts.jar clean-git --force file:.

# Optionally delete additoinal unwanted tags (e.g. if they don't migrate correctly)
#git tag --delete tag4 tag5

# Rename other tags to remove a prefix
# Need to use gsed on a Mac (brew install gnu-sed)
#git filter-branch --tag-name-filter 'gsed -E "s/^MY-TAG_(.*)$/v\1/"' \
#    --prune-empty -- --all

# Move directory down.  Need to use gsed on a Mac (brew install gnu-sed)
#git filter-branch --index-filter \
#   'git ls-files -s | gsed "s-\t\"*-&parent\-dir/-" |
#           GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
#                   git update-index --index-info &&
#    mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' --tag-name-filter cat -- --all

# Then delete old tags
#git tag | grep MY-TAG | xargs git tag --delete

# Then manually add the .gitigore, and push to the repo (including git push --tags)

cd ..