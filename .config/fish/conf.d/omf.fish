# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# FFF
export FFF_HIDDEN=1
export FFF_OPENER="xdg-open"
export FFF_LS_COLORS=1
export FFF_STAT_CMD="stat"
export FFF_CD_ON_EXIT=1
export FFF_FAV1=~/.config/
export FFF_FAV2=~/dwm
export FFF_FAV3=~/pix/Wallpapers/
export FFF_FAV4=~/dox/
export FFF_FAV5=/
export FFF_FAV6=
export FFF_FAV7=
export FFF_FAV8=
export FFF_FAV9=
export FFF_FILE_FORMAT=" %f"
export FFF_MARK_FORMAT="> %f*"

# Terminal Factors
export TERMINAL="kitty"
export EDITOR="nvim"

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
alias ls='exa -al --color=always --group-directories-first'

#pfetch
#~/color-scripts/color-scripts/bars
