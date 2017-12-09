PATH=$PATH:~/scripts:~/android-studio/bin:~/bin/intellij/bin:~/code/direnv
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /home/augustus/.travis/travis.sh ] && source /home/augustus/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias ..='cd ..'
alias trash='mv -t ~/trash'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

eval "$(direnv hook zsh)"
