### Remove fish greeting ###
set fish_greeting

### Aliases ###
thefuck --alias | source
alias copydir="pwd | xsel -b"
alias ofd="xdg-open ."
alias cls='clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

### Functions ###
function __fish_default_command_not_found_handler
    fish_insulter $argv
end

### Exports ###
set FZF_DEFAULT_COMMAND "fd . $HOME"
set FZF_FIND_FILE_COMMAND "$FZF_DEFAULT_COMMAND"
set FZF_CD_COMMAND "fd -t d . $HOME"

set PATH "$HOME/.gem/ruby/2.7.0/bin:$PATH"
set TERM xterm-256color
set -x BC_ENV_ARGS "$HOME/.bc"

### Spacefish configs ###
set SPACEFISH_PROMPT_ORDER battery time user dir host git package node docker ruby golang rust kubecontext exec_time line_sep jobs exit_code char
set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_USER_SHOW always
set SPACEFISH_EXEC_TIME_ELAPSED 1
set SPACEFISH_CHAR_SYMBOL ❯

### Init scripts ###
colorscript random