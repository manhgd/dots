set completion-ignore-case on
set mark-symlinked-directories on
set match-hidden-files off
set completion-query-items 200

export EDITOR="nano"
export PS1='\[\e[1;32m\]\u \w \$\[\e[0m\] '
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../../'                     # Go back 3 directory levels
alias grep='grep --color=always -ni'
alias dsclean='find . -type f -name .DS_Store -print0 | xargs -0 rm'
alias ls='ls --color=auto --classify --group-directories-first --human-readable'
alias l='ls'
alias ll='ls -la'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias l.='ls -d .* --color=auto'
alias h='history'
alias j='jobs -l'
alias rand='dd if=/dev/urandom count=1 2> /dev/null | uuencode -m – | sed -ne 2p | cut -c -16'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTCONTROL=ignoredups;

export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
