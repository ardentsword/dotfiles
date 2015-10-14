#C Find all folders
alias lsf="ls -alF | grep /$"

#C This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -Sh | sort -n -r |more"

#C Command line mplayer movie watching for the win.
#alias mp="mplayer -fs"

#C Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

#C Easy move up directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#C Make previous command sudo
alias s='sudo "$BASH" -c "$(history -p !!)"'

#C Rm wil now prompt for deletion and show output
alias rm="rm -v"

#C easy archive extract
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
 
#C Create dir and cd into it
function md () { mkdir -pv "$@" && cd "$@"; }