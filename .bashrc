export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# brew update
alias update="brew update && brew upgrade"

# list
alias ll="ls -la"
alias la="ls -a"
alias l="ls -l"

# avoid making mistakes
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# git
alias g="git"
alias gl="git log"
alias glo="git log --oneline --graph --decorate --all"
alias gd="git diff"
alias gst="git status"
alias gsw="git show"
alias gc="git checkout"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias gac="git add -A && git commit -m"
alias gps="git pull && git push"
alias gpl="git pull"
alias gm="git merge"
alias grh="git reset --hard"
alias grh0="git reset --hard HEAD"
alias grh1="git reset --hard HEAD~1"

# keygen
alias sshkeygen='ssh-keygen -t ed25519'

# wireguard
alias wg-up='wg-quick up wg_config'
alias wg-down='wg-quick down wg_config'

# mkdir + cd
mkcdir() {
  if [ -d "$1" ]; then
    printf "mkcdir: warning, \"%s\" already exists\n" "$1"
  else
    mkdir -p "$1"
  fi && cd "$1"
}

# python
alias python='python3'
[ -f "$HOME/python/venv/bin/activate" ] && \. "$HOME/python/venv/bin/activate"

# other aliases
[ -f "$HOME/.bash_aliases" ] && \. "$HOME/.bash_aliases"
