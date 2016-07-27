#!/usr/bin/env bash
echo -n "your email:";
read $email
echo -n "your name:";
read $name
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "vim"
git config credential.helper 'cache --timeout=36000000'
