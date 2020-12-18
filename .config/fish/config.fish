### Remove fish greeting ###
set fish_greeting

### Spacefish configs ###
set SPACEFISH_PROMPT_ORDER battery time user dir host git package node docker ruby golang rust kubecontext exec_time line_sep jobs exit_code char
set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_USER_SHOW always
set SPACEFISH_EXEC_TIME_ELAPSED 1
set SPACEFISH_CHAR_SYMBOL ❯

### Aliases ###
thefuck --alias | source
alias copydir="pwd | xsel -b"
alias ofd="xdg-open ."
alias lc='colorls -1'
alias lca='colorls -1a'
alias lcf='colorls -la'
alias lcg='colorls -la --gs'
alias l='lc'
alias cls='clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

### Kubectl ###
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'
alias kgs='kubectl get svc'
alias kgsa='kubectl get svc --all-namespaces'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'
alias kgi='kubectl get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'
alias kcn='kubectl config set-context (kubectl config current-context) --namespace'
alias kgd='kubectl get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'
alias kl='kubectl logs'

### Functions ###
function __fish_default_command_not_found_handler
    fish_insulter $argv
end

# Execute a random color script
colorscript random

### Exports ###
set FZF_DEFAULT_COMMAND "fd . $HOME"
set FZF_FIND_FILE_COMMAND "$FZF_DEFAULT_COMMAND"
set FZF_CD_COMMAND "fd -t d . $HOME"
set FZF_DEFAULT_OPTS '--cycle --layout=reverse --preview-window=wrap'

set PATH /home/$USER/.gem/ruby/2.7.0/bin:$PATH
set PATH /home/$USER/.local/bin:$PATH
set TERM xterm-256color
