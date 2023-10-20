if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

alias rmi="rm -i"
alias ll="ls -l"
alias lm="ls -al"
alias search="yay -Ss"
alias remove="yay -Rsc"
alias install="yay -S"
alias update="yay -Syy"
alias upgrade="yay -Syu"
alias clean="yay -Sc"
alias purge="yay -Rsc $(yay -Qdtq)"
alias dotfiles='/usr/bin/git --git-dir=$HOME/Documents/.dotfiles/ --work-tree=$HOME'
