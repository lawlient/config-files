# ls aliases
alias ll='ls -halF --time-style=long-iso'
alias lt='ls -halF --time-style=long-iso -tr'

# git alias
alias gl='git pull origin HEAD:refs/for/master'
alias gp='git log -p'
alias gd='git diff -w'
alias gac='git add --all --verbose; and git commit -v'
alias gb='git branch -a'
alias gs='git status'
# NOTE: gc is a command 'graph count'
alias gc='git config -l'
alias gg="git log --author-date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai) %C(bold blue)<%an>%Creset'"
