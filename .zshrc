# Path to your oh-my-zsh installation.
export ZSH="/home/ziox/.config/oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.

# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux colored-man-pages)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-directory-history/zsh-directory-history.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
### Export
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
# 
export TERM="xterm-256color"              # getting proper colors
export TERMINAL="kitty"
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export EDITOR="vim"
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
path+=('/home/ziox/.local/bin')
### Startup Applications
pfetch
/home/ziox/color-scripts/color-scripts/bars

### Archive Extraction
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Config Links
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"

### Yay
alias yi="yay -S"
alias ya="yay -Sua"
alias yu="yay -Syu"
alias yr="yay -Rs"

### Root
alias doas="doas --"

### ls to exa
alias ls='exa -al --color=always --group-directories-first' # based
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

### Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

### Colorized Grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

### Adding flags
alias cp="cp -i"                          # confirm before overwriting something

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

### Programs
alias matrixme="cmatrix -ksbC magenta -M Arch"
alias smci="sudo make clean install"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 
alias rm="rm -i"
alias btop="bpytop"
alias tldr="tldr --theme=base16"
alias cat="bat"
alias sed="sd"

# Broot
alias br='br -dhp'
alias bs='br --sizes'

### Misc
alias new="clear; pfetch"
alias mount="mount | column -t"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

### Navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'
alias dox="cd ~/dox"

### youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /home/ziox/.config/broot/launcher/bash/br

#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Functions

f() { # CD on fff exit
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

PROMPT="%F{black}[%F{magenta} %~%F{black}]
%F{black}[%F{red} %n%F{magenta}@%F{yellow}%m%F{black}] 
%F{black}[%F{green}%(?..%F{red})%f%F{black}] %F{green}$%f "

RPROMPT="%F{black}[%F{blue} %T%F{black}]"
