set -o vi

function setup() {
  echo "source $pwd/extra_cmd.sh" >> ~/.bashrc
  echo "alias ecmd=\"vim $pwd/extra_cmd.sh\"" >> ~/.bashrc
}

export VISUAL=vim
export EDITOR=vim

## Common commands
alias install='sudo apt-get install - y'
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
