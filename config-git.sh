#!/usr/bin/env bash
echo "your email:";
read $email
echo "your name:";
read $name
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "vim"
git config credential.helper 'cache --timeout=36000000'
