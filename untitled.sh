#!/bin/sh
 
git filter-branch --env-filter '
 
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
 
if [ "$GIT_COMMITTER_EMAIL" = "jackie_anxis@foxmail.com" ]
then
    cn="yueziyao"
    cm="351599628@qq.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "jackie_anxis@foxmail.com" ]
then
    an="yueziyao"
    am="351599628@qq.com"
fi
 
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
 