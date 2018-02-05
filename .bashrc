# PATH
export PATH="$PATH:$HOME/scripts/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/gocode/bin"
export PATH="$HOME/pressly/api/scripts:$PATH"

# GOPATH
export GOPATH="$HOME/gocode"

# General alias
alias ..='cd ..'
alias ls='ls -lahG'
alias c='clear'
alias cl='clear'
alias claer='clear'
alias celar='clear'
alias cealr='clear'
alias cealr='clear'
alias scripts="cd $HOME/scripts"
alias speedtest="curl http://speedtest.wdc01.softlayer.com/downloads/test10.zip > /dev/null"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --incognito"

# Grep
export GREP_COLOR="91"
alias grep='grep --color=always --exclude-dir={node_modules,.jest-cache,.build}'

# Git
alias gs="git status"
alias gd="git diff"
alias gp="git pull"
alias gti="git"
alias gits="git s"
alias gtis="git s"

# Postgress
alias lpsql="/Applications/Postgres.app/Contents/Versions/latest/bin/psql"

# Pressly aliases
alias ui="cd $HOME/pressly/ui-components"
alias api="cd $HOME/pressly/api"
alias dash="cd $HOME/pressly/dashboard/webapp/src/app"
alias press="cd $HOME/pressly/ng-pressilla/src"
alias models="cd $HOME/pressly/dashboard/webapp/src/modules/app/models"
alias pressly="cd $HOME/pressly"
alias postman="cd $HOME/pressly/postman"
alias embed="cd $HOME/pressly/embeds/src"
alias blue="cd $HOME/pressly/blue-suede/src"
alias bs="cd $HOME/pressly/blue-suede/src"
alias mb="cd $HOME/pressly/moody-blue"
alias moo="cd $HOME/pressly/moody-blue"
alias little="cd $HOME/pressly/mobx-little-router"
alias basic="cd $HOME/pressly/mobx-little-router/examples/basic"
alias router="cd $HOME/pressly/mobx-little-router/packages/mobx-little-router"
alias ext="cd $HOME/pressly/chrome-extension/src"
alias extent="cd $HOME/pressly/chrome-extension/src"
alias extension="cd $HOME/pressly/chrome-extension/src"
alias extensions="cd $HOME/pressly/chrome-extension/src"

# Thunderbox aliases
alias thunder="cd $HOME/git/thunderbox-client"
alias thunderserver="cd $HOME/git/thunderbox-server"

# Climby aliases
alias cs="cd $HOME/git/climby-server"
alias cc="cd $HOME/git/climby-client"

# Sportling aliases
function sc() {
  CLIENT_DIR="$HOME/sportling/client/src"
  CLIENT_GIT_DIR="$HOME/git/client/src"

  if [[ -d $CLIENT_DIR ]]; then
    cd $CLIENT_DIR
  else
    cd $CLIENT_GIT_DIR
  fi
}

function ss() {
  SERVER_DIR="$HOME/sportling/server"
  SERVER_GIT_DIR="$HOME/git/server"

  if [[ -d $SERVER_DIR ]]; then
    cd $SERVER_DIR
  else
    cd $SERVER_GIT_DIR
  fi
}

function sx() {
  AWS_DIR="$HOME/sportling/aws"
  AWS_GIT_DIR="$HOME/git/aws"

  if [[ -d $AWS_DIR ]]; then
    cd $AWS_DIR
  else
    cd $AWS_GIT_DIR
  fi
}

# NPM
alias npm-list="npm list -g --depth=0"
alias npm-dated="sudo npm outdated -g --depth=0"

start() {
  if [ ! -f ./package.json ]; then
    echo "[Error] Could not locate file: package.json"
  else
    npm run start $@
  fi
}

# Other
alias jasmine="jasmine-node --autotest --color"
alias md="msee"

# LS alias
function l() {
  if [[ $@ == "s-la" || $@ == "s-al" || $@ == "s-l" ]]; then
    command ls -lahG
  else
    command ls "$@"
  fi
}

function ls() {
  if [[ $@ == "-lahG a-l" ]]; then
    command ls -lahG
  else
    command ls "$@"
  fi
}

##
# CD alias
# Move into files directory if known extension
##
function cd() {
  string=$@

  if [[ ${string: -3} == ".js" || ${string: -4} == ".css" || ${string: -5} == ".html" || ${string: -5} == ".styl" || ${string: -7} == ".coffee" ]]; then
    command cd "$(dirname $string)"
  else
    command cd "$@"
  fi
}

# AWS EC2
ec2() {
  if [[ $1 == "-d" ]]; then
    command aws ec2 describe-instances
  elif [[ $1 == "-start" || $1 == "-s" ]]; then
    command aws ec2 start-instances --instance-ids=$2
  elif [[ $1 == "-stop" ]]; then
    command aws ec2 stop-instances --instance-ids=$2
  elif [[ $1 == "-elastic" ]]; then
    command aws ec2 describe-addresses
  else
    command aws ec2 $1
  fi
}

# Exercism
exe() {
  command cd $HOME/git/exercism/javascript
  command cd $(ls -1dt ./*/ | head -n 1)
}

# Encryption
encrypt() {
  command openssl enc -aes-256-cbc -salt -in $1 -out $2
}

decrypt() {
  command openssl enc -d -aes-256-cbc -in $1 -out $2
}

# LS Colors
export CLICOLOR=1
export LSCOLORS=exFxCxDxbxegedabagacab

# set .bash_history line limit
export HISTFILESIZE=
export HISTSIZE=25000

# Deafult editor
export EDITOR=vim

# Responsive Prompt
parse_git_branch() {
  echo `__git_ps1 "%s"`
}

parse_remote_state() {
  remote_state=$(git status -sb 2> /dev/null | grep -oh "\[.*\]")
    echo $remote_state
}

prompt() {
  PS1="${GREEN}[$(parse_git_branch)$(parse_remote_state)]${COLOREND} \h:${BLUE}\W$ ${COLOREND}"
}

PROMPT_COMMAND=prompt

## Set some colours
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
MAGENTA="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"
COLOREND="\[\e[00m\]"

# gitcompletion exports
export GIT_PS1_SHOWCOLORHINTS=1

# Disable autocompletion
complete -r
