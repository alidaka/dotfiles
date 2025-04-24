## Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh



################
# zsh config
################
ZSH_THEME="rr_alidaka"
CASE_SENSITIVE="true"
export UPDATE_ZSH_DAYS=60

# Would you like to use another custom folder than $ZSH/custom?
PARENT=$(dirname $(readlink ~/.zshrc))
ZSH_CUSTOM=$PARENT/zsh

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

unsetopt auto_cd
unsetopt auto_pushd



################
# User configuration
################
alias ..='cd ..'
archive() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: archive file1 [file2 ...]"
    return 1
  fi

  local date=$(date +%F)
  local destination=~/archive/$date
  mkdir -p $destination
  mv "$@" $destination
}

# Linux (x server) equivalents for MacOS convenience
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'

# kubectl
alias k=kubectl
#source <(kubectl completion zsh)
#complete -F __start_kubectl k

eval "$(direnv hook zsh)"

if type git-together > /dev/null; then
  alias git=git-together
fi

export PATH="$PATH:/Users/alidaka/.dotnet/tools"
