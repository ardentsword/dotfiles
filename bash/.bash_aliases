#C = custom (this whole files is custom)

# Some more ls aliases
alias ll='ls -lFh'
alias la='ls -AlFh'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'

# Find all folders
alias lsf="ls -alF | grep /$"

# Command line mplayer movie watching for the win.
#alias mp="mplayer -fs"

# Easy move up directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Make previous command sudo
alias s='sudo "$BASH" -c "$(history -p !!)"'

# Rm wil now prompt for deletion and show output
alias rm="rm -v"

# easy archive extract
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
# Create dir and cd into it
function md () { mkdir -pv "$@" && cd "$@"; }

# easy apt-get 
alias apt-get='sudo apt-get'

# Calculator
alias calc='bc -l'

# Show all open ports
alias ports='netstat -tulanp'

# Show memory usage
alias meminfo='free -m -l -t'

# Aliases for showing used harddisk space/files
alias df='df -H'
alias du='du -ch'
alias du1='du -ch -d 1 | sort -rh'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -Sh | sort -rh |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Show all disks, partitions with sizes
alias lds='sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'

alias ltd='docker exec -it lt-dev /bin/bash'
alias lt-dd-cms='lt-dd project:execute -p mpm-cms -n -- '
alias lt-dd-web='lt-dd project:execute -p mpm-website -n -- '
alias lt-dd-w2='lt-dd project:execute -p wrqr2 -n -- '
alias gcp='git cherry-pick'
alias fm='xinput set-prop 9 "libinput Scroll Method Enabled" 0, 0, 1 && xinput set-prop 9 "libinput Button Scrolling Button" 10'

alias gdq='screen -d -m streamlink https://www.twitch.tv/gamesdonequick best -p mpv'
