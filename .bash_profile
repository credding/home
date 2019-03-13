# --- Prompt ---

RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
TSL=$(tput tsl)
FSL=$(tput fsl)

PROMPT_DIRTRIM=3
export PS1="\[$TSL\W$FSL\]\[$BLUE\]\u\[$RESET\]@\[$YELLOW\]\H \[$GREEN\]\w \[$RESET\]\\$ "

# --- Environment ---

export PATH=$HOME/.local/bin:$PATH

export EDITOR=/usr/bin/nano

# --- Aliases ---

alias mkdir='mkdir -p'
alias ls='gls -AFGhv --color=auto --group-directories-first'

ssh() {
    if [[ $TERM == 'xterm-kitty' ]]; then
        kitty +kitten ssh $@
    else
        ssh $@
    fi
}

sudo() {
    if [[ $TERM == 'xterm-kitty' ]]; then
        $(which sudo) TERMINFO=/Applications/kitty.app/Contents/Frameworks/kitty/terminfo $@
    else
        $(which sudo) $@
    fi
}

# --- Other ---

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# SDKMAN!
export SDKMAN_DIR="/Users/credding/.sdkman"
[[ -s "/Users/credding/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/credding/.sdkman/bin/sdkman-init.sh"
