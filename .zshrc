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
gpl_all() {
  BRANCH=$(git branch --show-current)
  for REMOTE in $(git remote); do
    git pull $REMOTE $BRANCH
  done
}
gps_all() {
  gpl_all
  BRANCH=$(git branch --show-current)
  for REMOTE in $(git remote); do
    echo "Pushing on remote $REMOTE on branch $BRANCH ..."
    git push $REMOTE $BRANCH
  done
}
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
alias gps="gps_all"
alias gpl="gpl_all"
alias gm="git merge"
alias grh="git reset --hard"
alias grh0="git reset --hard HEAD"
alias grh1="git reset --hard HEAD~1"

# keygen
alias sshkeygen='ssh-keygen -t ed25519'

# wireguard
alias wg-up='wg-quick up main'
alias wg-down='wg-quick down main'

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
alias pip='pip3'
[ -f "$HOME/Python/Main/bin/activate" ] && \. "$HOME/Python/Main/bin/activate"

# Rust
if [ -f $HOME/.cargo/env ]; then
    . $HOME/.cargo/env
fi

# neovim config path
alias nvimconfig="cd $HOME/.config/nvim/lua/config/"

# other aliases
[ -f "$HOME/.bash_aliases" ] && \. "$HOME/.bash_aliases"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/aptenodytes/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
