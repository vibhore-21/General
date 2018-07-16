# ~/.bashrc: executed by bash(1) for non-login shells
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

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\W\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="${debian_chroot:+($debian_chroot)}\u@\h \W$ "
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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


setterm_title(){
       echo -en "\033]0;$1\a"
}

export GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-prompt.sh # This is part of git contrib's directory
export PROMPT_COMMAND='__git_ps1 "\[\$(date +%H:%M:%S)\] \u:\W" "\\\$ "'


alias cddev3='setterm_title dev3; ssh dev3;'
alias cdbb='source /srv/webapps/bigbasket.com/virtualenvs/bigbasket1.11/bin/activate; cd /srv/webapps/bigbasket.com/BigBasket; nvm use v6'
alias cdmember='source /srv/webapps/bigbasket.com/virtualenvs/bb_member/bin/activate; cd /srv/webapps/bigbasket.com/bb_member; export DJANGO_SETTINGS_MODULE=config.settings.dev' 
alias importsql='mysql -u root -h 127.0.0.1 --port=3306 -p bbdb_20141207200136'
alias startsolr='setterm_title solr; cd /srv/webapps/bigbasket.com/apache-solr-3.6.2/example;java -jar start.jar'
alias pycharm='/home/vibhore/installed_packages/pycharm-2017.1/bin/pycharm.sh'
alias tunnel_='sshuttle --dns -vvr bbadmin@54.179.6.190 0/0'
alias gvim="gvim 2>/dev/null"
alias cdqa1="setterm_title qa1; ssh qa1; cdqa1"
alias rs="setterm_title runserver; cdbb; ! service aerospike status && sudo service aerospike start;NEW_RELIC_CONFIG_FILE=../conf/newrelic.ini newrelic-admin run-program ./manage.py runserver 0.0.0.0:8000" alias unblock_network="rfkill unblock all"
alias spi="setterm_title shell_ipython; ! service aerospike status && sudo service aerospike start; cdbb; ./manage.py shell_plus --ipython"
alias sp="setterm_title shell_plus; ! service aerospike status && sudo service aerospike start; cdbb; ./manage.py shell_plus"
alias dbs="setterm_title db_shell; cdbb; ./manage.py dbshell"
alias cdreadprod="setterm_title read_Prod; ssh readProd;"
alias cdelastic171="cd /srv/webapps/bigbasket.com/elasticsearch-1.7.1/bin"
alias cdtech="cd /home/vibhore/Documents/personal/tech/"
alias gs="git status"
alias es="cdbb;setterm_title es ;  ../elastic2.3/elasticsearch-2.3.0/bin/elasticsearch" 
alias cdgenric="source /srv/webapps/bigbasket.com/virtualenvs/genric/bin/activate; cd /home/vibhore/Documents/personal/tech/"
alias cdflip="source /home/vibhore/Documents/personal/tech/flipkart/flipkart_env/bin/activate; cd  /home/vibhore/Documents/personal/tech/flipkart/source"
alias es_status="curl -X GET 'http://localhost:9200'"
alias as="sudo service aerospike start"
alias dovpn="cd ~/vpn; sudo openvpn --config vibhore.ovpn"
alias doqavpn="cd ~/qavpn; sudo openvpn --config bbadmin.ovpn"
export NVM_DIR="/home/vibhore/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias start_clan='cdbb; cd services/clan/; PORT=4001 node debug ./bin/www;'


printLine () 
{ 
    sed -n -e "$1p" "$2"
}

source <(kubectl completion bash)
alias cdbb11='source /srv/webapps/bigbasket.com/virtualenvs/bigbasket1.11/bin/activate; cd /srv/webapps/bigbasket.com//BigBasket'
alias qavpn='cd ~/qavpn; sudo openvpn --config bbadmin.ovpn'
alias cdk8s='cd /srv/webapps/bigbasket.com/BBrepos/bb-k8s-resources/'
