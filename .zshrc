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
if pgrep emacs >/dev/null 2&>1; then :; else emacs --daemon; fi

# direnv
eval "$(direnv hook zsh)"

# aliases
if [ -f ~/.aliases ]; then source ~/.aliases; fi

# git
git config --global pager.branch false

# zsh config
autoload -U select-word-style
select-word-style bash
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed
