# bind {
if [[ -t 1 ]];then
    bind 'set match-hidden-files off'
#bind '"\e[1;5D" backward-word'
#bind '"\e[1;5C" forward-word'
    stty stop undef
    stty werase undef #delete <C-w> binding
    bind '"\C-w": unix-filename-rubout'
fi
# bind }

# ps1 {
PS1=''
PS1=$PS1'$(echo $? > /tmp/$USER.ps1)'           # save exit status
PS1=$PS1'\[\e]0;'                         # begin window title
PS1=$PS1'['                               #  [
PS1=$PS1'$(tty|sed "s,/dev/pts/,,")'      #  (pts_number)
PS1=$PS1':'                               #  :
PS1=$PS1'${WINDOW:+$WINDOW}'              #  (screen_number)
PS1=$PS1'] '                              #  ] 
PS1=$PS1'\u@\h'                           #  (user)@(host)
PS1=$PS1': \w'                            #  : (path)
PS1=$PS1'\a\]'                            # end window title
PS1=$PS1'\n'                              #  \n
PS1=$PS1'\[\e[36m\]'                      # begin color cyan
PS1=$PS1'['                               #  [
PS1=$PS1'$(tty|cut -b10-)'                #  (pts_number)
PS1=$PS1':'                               #  :
PS1=$PS1'${WINDOW:+$WINDOW}'              #  (screen_number)
PS1=$PS1'] '                              #  ] 
PS1=$PS1'\u@\h: '                         #  (user)@(host)
PS1=$PS1'\[\e[32m\]'                      # begin color green
PS1=$PS1'\w\n'                            #  : (path)\n
PS1=$PS1'$(if [[ $(cat /tmp/ps1) = 0 ]];' # if exit status is 0
PS1=$PS1'then echo "\[\e[37m\]\$ ";'      #  $ begin color white
PS1=$PS1'else echo "\[\e[31m\]\$ ";'      #  $ begin color red
PS1=$PS1'fi)'                             # end if
PS1=$PS1'\[\e[m\]'                        # begin color default
export PS1
# ps1 }

# ls {
    alias ls='ls -Fh --color=auto'
    alias la='ls -a'
    alias ll='ls -l'

    alias l='ls'
    alias lls='ls'
    alias lsl='ls'
    alias s='ls'
    alias sl='ls'
    alias sls='ls'
# ls }

alias ..='cd ..'
alias :q='exit'
alias gis='git status --short'
alias glog='git log --oneline --graph --branches --decorate=full \
            -$(($(stty size|cut -f1 -d" ")-8))'
alias glogo='glog origin/master'
alias em='emacs'
alias ema='emacs'
alias q='exit'
alias vi='vim'
alias x='exit'
complete -A hostname ping
complete -A user write
eval `dircolors ~/.colorrc`
export EDITOR=/usr/bin/vim
export LANG=en_US.UTF-8
export LESS='-iSR'
export LC_ALL=en_US.UTF-8
export TF_CPP_MIN_LOG_LEVEL=2

if [[ -f ~/.bashrc_local ]]; then
    source ~/.bashrc_local
fi

export PATH=$(echo $PATH|awk 'BEGIN{RS=ORS=":"}!a[$1]++'|head -1)

