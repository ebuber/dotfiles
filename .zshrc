# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# launch emacs
pgrep emacs>& /dev/null
if [ $? -eq 0 ]; then :; else emacs --daemon > /dev/null 2>&1; fi

# direnv
eval "$(direnv hook zsh)"

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# aliases
if [ -f ~/.aliases ]; then source ~/.aliases; fi

# git
export LESS="-F -X $LESS"

# python
export PYARROW_IGNORE_TIMEZONE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# zsh config
autoload -U select-word-style
select-word-style bash
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed

# nvidia stuff
#export LD_LIBRARY_PATH=/usr/local/nvidia/lib64/
#export LD_PRELOAD=/usr/local/nvidia/lib64/libnvidia-ml.so
#export PATH="/usr/local/nvidia/bin/:$PATH"
