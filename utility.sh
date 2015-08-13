export PYTHONIOENCODING=utf-8
export PYTHONUNBUFFERED=1
export PYTHONSTARTUP=~/.pythonrc
export PYTHONDONTWRITEBYTECODE=1
export PYTHONDEBUG=1

export PYCMD='PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1 PYTHONDEBUG=1 PYTHONIOENCODING=utf8 '
alias py="$PYCMD python3"
alias py3="$PYCMD python3 "
alias py2="$PYCMD python -B "
alias pdb="$PYCMD python3 -m pdb "
alias pdb3="$PYCMD python3 -m pdb "
alias pdb2="$PYCMD python -m pdb"
export NOSE_REDNOSE=1
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=~/.pyvenvs
source /usr/local/bin/virtualenvwrapper.sh

# Enable debugger
alias nosep='nosetests --with-progressive'
alias greppy="grep --color=always -ni -r --include=*.py  $1"
alias dns-clear='sudo discoveryutil mdnsflushcache'
function venv() {
  VENV="$(pwd)/venv/bin/activate"
  source "$VENV"
}
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home"
export JAVA_OPTS="-Xms4m -Xmx512m"
export JVM_OPTS=$JAVA_OPTS

export GOPATH=/usr/local/opt/go/lib
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/opt/go/libexec/bin:$JAVA_HOME/bin
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

function server() {
    local port="$1"
    if [ -z $port ]; then
        port=$(( ( RANDOM % 100 )  + 8800 ))
    fi
    local url="http://127.0.0.1:${port}/"
    echo "Serving HTML at $url"
    open $url
    python3 -m http.server "$port" >/dev/null 2>&1 &
}
alias wget='wget --trust-server-names --no-check-certificate '
alias ip="ifconfig | grep inet | sed -r 's/(prefix|netmask).*//g'"
alias mkutf8='iconv -c -t UTF-8 -f SHIFT-JIS ' # Convert ShiftJIS to UTF-8
alias du1='du -h --max-depth=1'
alias debian='vboxmanage startvm debian'
alias kanji='java -Xmx1000m -jar "/data/meta/KanjiTomo/KanjiTomo.jar" -run'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) \
    %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

export RED="\033[0;31m"
export CYAN="\033[0;36"
export LCYAN="\033[1;36"
export LGREEN="\033[1;32"
export LBLUE="\033[1;34"
export NC="\033[0m"
export GIT_C="printf \"$RED\"; git rev-parse --abbrev-ref HEAD; printf \"$NC\n\"; "
alias pubkey='pbcopy < ~/.ssh/id_rsa.pub; echo "Copied."'
alias gmt='git mergetool'
alias gd='git diff'
alias gpr='git pull --rebase'
alias gprm='git pull --rebase origin master'
alias grc='git rebase --continue'
alias gst='git status'
alias gc='git commit -a'
alias gexp='git archive --format gzip --output'
alias git1="git clone --depth=1"
alias gbs="git clone --depth=1 --single-branch -b " # Usage: gbs {branch} {repo}

restart() {
    local service="Library/LaunchAgents/homebrew.mxcl.@.plist"
    launchctl unload ~/$service
    launchctl load $service
}

iterm() {
    local cmd=""
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        cmd="; $args"
    fi

    osascript &>/dev/null <<EOF
        tell application "iTerm"
            tell current terminal
                launch session "Default Session"
                tell the last session
                    write text "cd \"$cdto\"$cmd"
                end tell
            end tell
        end tell
EOF
}

function rebase() {
    local current_branch="$(git rev-parse --abbrev-ref HEAD)"
    git checkout master
    git pull --rebase
    git checkout "$current_branch"
    git rebase master
}

function loop() {
    while :; do
        "$@"
        echo 'Hit CTRL+C to stop'
        echo 'Sleep...'
        sleep 2
    done
}

function with_branch() {
    printf "\033[0;31m"
    git rev-parse --abbrev-ref HEAD
    printf "\033[0m\n"
    "$@"
}


function pypi() {
    # Release a new version
    python3 setup.py register -r pypi
    python3 setup.py sdist upload -r pypi
}

function minify() {
    yuicompressor -o '.css$:.min.css' *.css
    yuicompressor -o '.js$:.min.js' *.js
}
