set -o vi

function setup() {
  echo "source $pwd/extra_cmd.sh" >> ~/.bashrc
  echo "alias ecmd=\"vim $pwd/extra_cmd.sh\"" >> ~/.bashrc
}

export VISUAL=vim
export EDITOR=vim

## Common functions.
## Accepts two arguments. Check if the first argumetn ends with the second argument.
## returns 0 if true.
function ends_with() {
 if [ "$#" -ne 2 ]; then
  echo "requires two arguments"
  return -1
 fi
 text="$1"
 end="$2"
 if [[ $text =~ .*"$end"$ ]]; then
  return 0
 fi
 return 1
}

## A function to install a package name or a deb file.
function install() {
  target="$1"
  ends_with $target ".deb"
  result=$?
  if [ $result == 0 ]; then
      sudo dpkg -i $target
  else
      sudo apt-get install -y $target
  fi
}
alias update='sudo apt-get update && sudo apt-get upgrade -y'

alias sbrc='source ~/.bashrc'
alias ack='ack-grep'
alias die='sudo shutdown now'


## Git shortcuts
alias pull='git pull --rebase origin master'
alias gdiff='git diff HEAD~1'
alias amend='git commit -a --amend'
alias gfdiff='git diff --name-only HEAD~1'
alias greset='git reset --hard HEAD~1'


## Tmux shortcuts
alias tl='tmux ls'
alias ta='tmux attach -t'
alias td='tmux attach -d'
alias open='xdg-open'
