## MacBook Pro
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
## MacBook Air
[ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"

## Setting PATH for Python 3.11
## The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## MacBook Pro
[ -f "/opt/homebrew/bin/nvim" ] && export VISUAL="/opt/homebrew/bin/nvim"
## MacBook Air
[ -f "/usr/local/bin/nvim" ] && export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"

# Force PHP version to 8.3 due to compatibility for PHP-CS-Fixer
export PATH="/usr/local/opt/php@8.3/bin:$PATH"
export PATH="/usr/local/opt/php@8.3/sbin:$PATH"
