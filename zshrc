export PS1='%B%f%1~%F{red} %bpwn%B $%f%b '

# save everything
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt BANG_HIST           # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY    # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY  # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY       # Share history between all sessions.
setopt INC_APPEND_HISTORY  # Pushes new to file. aka old sesions only have their own stuff, but new sessinos get everything :)
setopt HIST_FIND_NO_DUPS   # Do not display a line previously found.
setopt HIST_REDUCE_BLANKS  # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY         # Don't execute immediately upon history expansion.

# ^W stops at -
autoload -U select-word-style
select-word-style bash

alias ls='ls --color'
