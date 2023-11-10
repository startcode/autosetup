#!/usr/bin/env bash

git config --global core.editor "vim"
export GIT_EDITOR=vim

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
