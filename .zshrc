export ZSH="$HOME/.oh-my-zsh"

plugins=(git docker docker-compose chucknorris alias-finder bgnotify common-aliases copypath copyfile sudo extract web-search z kubectl zsh-autosuggestions dircycle gitignore)

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
zinit light Freed-Wu/zsh-help
zinit light ChrisPenner/copy-pasta
zinit light brymck/print-alias

eval "$(fzf --zsh)"
eval $(thefuck --alias)
eval "$(navi widget zsh)"

ZSH_ALIAS_FINDER_AUTOMATIC=true
export PRINT_ALIAS_PREFIX=' '
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
export PATH=/home/cardoso/.local/bin:$PATH
export PATH=/home/cardoso/.local/share/gem/ruby/3.0.0/bin:$PATH
export SUDO_PROMPT=$'\a[sudo] Por favor, informe a senha: '
export BROWSER=brave
export NAVI_PATH='~/.config/custom-navi-cheats:~/.local/share/navi/cheats'

alias ofd="open_command ."
alias lc='colorls -1'
alias lca='colorls -1a'
alias lcf='colorls -la'
alias lcg='colorls -la --gs'
alias cls='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
alias goo='google'
alias ogr='open_command https://github.com/cardoso-thiago/${PWD##*/}'
alias mbatt='upower -i /org/freedesktop/UPower/devices/battery_hid_dco2co26ofdo46obc_battery | grep percentage | lolcat'
alias rr='rm -rf'
alias mirrors='sudo reflector --latest 10 --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias btop='bpytop'
alias nfw='navi fn welcome'
### Atualização completa
alias yu='yay -Syu --devel --timeupdate'
### Limpeza de cache
alias ycc='yay -Scc'
### Script para limpar pacotes órfãos
alias yor='sh ~/HDD/Documentos/Configurações/orphanage.sh' 

# Alias YADM
alias yadd='yadm add'
alias yau='yadm add -u'
alias yacm='yadm commit -m'
alias yap='yadm push'
alias yas='yadm status'

bindkey '\e[1~' beginning-of-line
bindkey '\e[2~' overwrite-mode
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f "$HOME/.config/bash.command-not-found" ]; then
    . "$HOME/.config/bash.command-not-found"
fi

echo "\n"
fastfetch -c ~/.config/fastfetch/config-simple.jsonc

if [[ $(yadm status --porcelain) ]]; then
    echo "\n"
    print -P '%B%F{red}There are local configuration changes. YADM sync required.%f%b'
fi

function check_git_directory() {
    if [[ -d .git ]]; then
        onefetch --text-colors 9 10 11 12 13 --no-title --number-of-file-churns=0 --no-art
    fi
}

# Defina um hook para o comando 'cd' para verificar o diretório ao mudar de pasta
chpwd_functions+=(check_git_directory)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"