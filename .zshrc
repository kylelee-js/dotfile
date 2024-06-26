# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
        fzf
)

source $ZSH/oh-my-zsh.sh

alias c="clear"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim

alias dtc='dart fix --apply --code=require_trailing_commas'
alias python='python3'
alias fl='flutter'
alias frlocal='flutter run --flavor dev --dart-define-from-file=.env.local.json'
alias frdev='flutter run --flavor dev --dart-define-from-file=.env.dev.json'
alias fbdev='flutter build apk --flavor dev --dart-define-from-file=.env.dev.json'
alias fbprod='flutter build apk --flavor prod --dart-define-from-file=.env.release.json'

export PATH=$PATH:
export PATH=$PATH:/Applications/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
PATH=$(pyenv root)/shims:$PATH

export PATH="$PATH:`pwd`/Documents/flutter/bin"
export PATH="$PATH:/Users/kylelee/Library/Android/sdk/platform-tools/"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/kylelee/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
