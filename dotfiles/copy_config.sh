#!/usr/bin/env bash

copy_to_repo=true
local_path=$HOME

if [[ $# != 2 ]]; then
 echo "$0 repo --tolocal: copy cofigs from repo to local"
 echo "$0 repo --fromlocal: copy cofigs from local to repo"
 exit 0
fi

repo_path="$1"

if [[ $# == 2 && $2 == "--tolocal" ]]; then
  echo "copy configs from $repo_path to local"
  copy_to_repo=false
elif [[ $# == 2 && $2 == "--fromlocal" ]]; then
  echo "copy local configs to repo in $repo_path"
fi

files=(.vimrc .vim/UltiSnips .vim/.ycm_extra_conf.py .tmux.conf .zshrc .bashrc_docker)

if $copy_to_repo; then
  for f in ${files[@]}; do
    echo $f
    mkdir -p $(dirname $repo_path/$f)
    cp -r "$local_path/$f" "$(dirname $repo_path/$f)"
  done
else
  for f in ${files[@]}; do
    echo $f
    mkdir -p $(dirname $local_path/$f)
    cp -r "$repo_path/$f" "$(dirname $local_path/$f)"
  done
fi
