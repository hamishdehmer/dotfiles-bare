# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
pfetch
/home/ziox/color-scripts/color-scripts/bars
alias pacin="yay -S"
alias pacup="yay -Syu"
alias pacre="yay -Rs"
alias doas="doas --"
alias matrixme="cmatrix -ksbC magenta -M Arch"
alias smci="sudo make clean install"
alias ls='exa -al --color=always --group-directories-first'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
alias rm="rm -i"
