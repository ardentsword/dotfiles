# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#C for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

#bla
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#C Combine multiline commands into one in history
shopt -s cmdhist

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
    else
		color_prompt=
    fi
fi

. ~/.git-prompt

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
TEST="\[\033[50m\]" # test
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[91m\]" # foreground red
FGRN="\[\033[92m\]" # foreground green
FYEL="\[\033[93m\]" # foreground yellow
FBLE="\[\033[94m\]" # foreground blue
FMAG="\[\033[95m\]" # foreground magenta
FCYN="\[\033[96m\]" # foreground cyan
FWHT="\[\033[97m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[101m\]" # background red
BGRN="\[\033[102m\]" # background green
BYEL="\[\033[103m\]" # background yellow
BBLE="\[\033[104m\]" # background blue
BMAG="\[\033[105m\]" # background magenta
BCYN="\[\033[106m\]" # background cyan
BWHT="\[\033[107m\]" # background white

# Determine active Python virtualenv details.
if test -z "$VIRTUAL_ENV" ; then
    PYTHON_VIRTUALENV=""
else
    PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
fi

if [ "$color_prompt" = yes ]; then
    # PS1FRONT="$HC$FMAG[ $FGRN${debian_chroot:+($debian_chroot)}\u$FYEL@$FGRN\h$FYEL: $FBLE\w" #
    # PS1FRONT="$FMAG[ $FGRN\u$FYEL@$FGRN\h$FYEL"
    # PS1FRONT="$FMAG[ $FBLK$BGRN$FBLK \u $FGRN$BBLK$FBLK$BYEL$FBLK \h $FYEL$BBLK$FBLK$BBLE$FBLK \w $FBLE$BBLK "
    if [ "$LC_PUTTY_FONT" = "powerline" ]; then
        PS1FRONT="$FBLK$BGRN$FBLK \h $FGRN$BYEL$FBLK \u $FYEL$BBLE$FBLK ${PYTHON_VIRTUALENV}\w $BBLK"
        PS1BACK="$FBLE$BBLK $RS"
    else
        PS1FRONT="$HC$FMAG[ $FGRN${debian_chroot:+($debian_chroot)}\u$FYEL@$FGRN\h$FYEL: $FBLE\w"
        PS1BACK=" $FMAG]$FYEL\\$ $RS"
    fi
    
    # git in bash
    PROMPT_COMMAND='__git_ps1_new "'$PS1FRONT'" "'$PS1BACK'";'
else
    PS1="$RS${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
    PS2="&gt; "
fi
unset color_prompt force_color_prompt

# WELCOME SCREEN

echo ""
echo -ne "\033[32m""Hello, $USER. today is "; date
echo -e "\033[37m"; cal -3 ;
echo -ne "\033[36m";
echo -ne "\033[35m""Sysinfo:";uptime ;echo ""

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# make sure sudo works with aliases
alias sudo='sudo '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#C include extra aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
