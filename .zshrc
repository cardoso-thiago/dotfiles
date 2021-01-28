export ZSH="/home/cardoso/.oh-my-zsh"

plugins=(git docker docker-compose chucknorris alias-finder bgnotify common-aliases copydir copyfile sudo extract httpie ubuntu web-search z kubectl)
source $ZSH/oh-my-zsh.sh

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ZSH_ALIAS_FINDER_AUTOMATIC=true
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export PATH=/home/cardoso/.local/bin:$PATH
export TERM=xterm-256color
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export BC_ENV_ARGS="$HOME/.bc"

alias ofd="xdg-open ."
alias lc='colorls -1'
alias lca='colorls -1a'
alias lcf='colorls -la'
alias lcg='colorls -la --gs'
alias cls='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'

eval "$(starship init zsh)"

colorscript random

if [ -f "$HOME/.config/bash.command-not-found" ]; then
    . "$HOME/.config/bash.command-not-found"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/cardoso/.sdkman"
[[ -s "/home/cardoso/.sdkman/bin/sdkman-init.sh" ]] && source "/home/cardoso/.sdkman/bin/sdkman-init.sh"