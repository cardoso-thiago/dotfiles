export ZSH="$HOME/.oh-my-zsh"

plugins=(git docker docker-compose chucknorris alias-finder bgnotify common-aliases copypath copyfile sudo extract web-search z kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

if [[ ! -f $HOME/.zinit/bin/zi.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zi.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

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
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
export PATH=/home/cardoso/.local/bin:$PATH
export PATH=/home/cardoso/.local/share/gem/ruby/3.0.0/bin:$PATH
export TERM=xterm-256color
export SUDO_PROMPT=$'\a[sudo] Por favor, informe a senha: '
export BROWSER=brave

alias ofd="open_command ."
alias lc='colorls -1'
alias lca='colorls -1a'
alias lcf='colorls -la'
alias lcg='colorls -la --gs'
alias cls='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
alias goo='google'
alias ogr='open_command https://github.com/cardoso-thiago/${PWD##*/}'
alias kbatt='upower -i /org/freedesktop/UPower/devices/battery_hid_dco2co26ofdo46obc_battery | grep percentage | lolcat'
alias mbatt='upower -i /org/freedesktop/UPower/devices/battery_hidpp_battery_0 | grep percentage | lolcat'
alias kfn='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode'
alias rr='rm -rf'
alias mirrors='sudo reflector --latest 10 --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias btop='bpytop'
alias yayu='yay -Syu --devel --timeupdate'
alias yayc='yay -Scc'

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f "$HOME/.config/bash.command-not-found" ]; then
    . "$HOME/.config/bash.command-not-found"
fi

echo "\n"
neofetch

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"