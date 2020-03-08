# .bashrc

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export WINEPREFIX="$HOME/data/wine"

# User specific aliases and functions

# ls shorthand and auto-coloring
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"

# cd shorthand
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# grep shorthand and auto-coloring
alias grep='grep --color=auto'
alias zgrep='zgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias egrep='egrep --color=auto'
alias zegrep='zegrep --color=auto'
alias xzegrep='xzegrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'

# always show prompt in ed
alias ed='ed -p \*'

# man shorthand
alias mank='man -k'

# always use vim-X11
alias vim='vimx'

# date format
alias datef='date +%a\ %b\ %d\ %T\ %Y'

# ncmcpp
alias ncm='ncmpcpp'