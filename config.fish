# Some good tools:
# sudo apt install silverlight-ag
# sudo pip install icdiff

# Remove shit time right prompt in oh-my-fish.
# Override fish_right_prompt function in
# ~/.local/share/omf/themes/default/fish_right_prompt.fish.
function fish_right_prompt
end

# Path to Oh My Fish install.
# set -q XDG_DATA_HOME
#   and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#   or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
# set -gx OMF_CONFIG "/home/justme0/.config/omf"

# Load oh-my-fish configuration.
##source $OMF_PATH/init.fish

# fish_vi_key_bindings

set PATH /sbin /usr/local/sbin /usr/sbin /usr/local/cuda/bin $PATH 2> /dev/null

set -gx C_INCLUDE_PATH     /usr/include/x86_64-linux-gnu
set -gx CPLUS_INCLUDE_PATH /usr/include/x86_64-linux-gnu
set -gx LD_LIBRARY_PATH    /usr/local/lib

set -gx GDBHISTFILE        ~/.gdb_history
set -gx GCC_COLORS         1
#set -gx LLDB               /usr/bin/lldb-3.6
set -gx EDITOR             /usr/bin/vim
set -gx LESS               -iR # http://stackoverflow.com/a/26069/1204713
#set -gx PAGER              most # apt-get install most
set -gx MANWIDTH           72
#set -gx BROWSER            chromium-browser

set fish_color_search_match --background='144'


# YouCompleteMe relatedot-files/config.fish'

function e
  emacs $argv &
end
alias en='emacs -nw'
function eg
  emacs --eval "( gdb \" gdb -i=mi --args $argv \" )" &
end
function eng
  emacs -nw --eval "( gdb \" gdb -i=mi --args $argv \" )"
end

alias vf='vi ~/.config/fish/config.fish'
alias vv='vi ~/.vimrc'

# git
alias gb='git branch -a'
# NOTE: gc is a command 'graph count'
alias gc='git config -l'
alias go='git checkout' # TODO: gco <tab> failed
alias gac='git add --all --verbose; and git commit -v'
alias gg="git log --author-date-order --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ai) %C(bold blue)<%an>%Creset'"
alias gl='git pull'
alias gs='git status'
alias gd='git diff -w'


function pp
  # ps --sort=-pcpu -eo pcpu,comm,pid,user | head -n 11
  ps --sort=-pcpu aux | head -n 6
end

if type gvfs-trash > /dev/null 2>&1
  alias t='gvfs-trash'
else
  # `sudo apt-get install trash-cli
  alias t='trash'
  # function t
  #   kioclient move $argv trash:/
  # end
end

if type gvfs-tree > /dev/null 2>&1
  alias tree='gvfs-tree'
end

##git config --global core.excludesfile ~/dot-files/.gitignore_global

ulimit -c unlimited
