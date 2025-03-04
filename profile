eval "$(/opt/homebrew/bin/brew shellenv)"

export SVN_EDITOR="nvim"

alias c='clear'
alias x='exit'
alias p='pwd'
alias v='nvim'
alias n='nvim'
alias s='svn'
alias g='git'
alias gs='git status'
alias gf='git diff'
alias gb='git branch'
alias glp='git log -p'
alias glo='git log --oneline'
alias profile='nvim ~/.profile'
alias bashrc='nvim ~/.bashrc'
alias vimconfig='nvim ~/.vimrc'
alias ci='docker rmi -f $(docker images -f "dangling=true" -q )'
alias cv='docker volume rm -f $(docker volume ls -qf dangling=true)'
alias dsp='docker system prune'
alias d='docker compose'
alias disk='df -h'
alias h='history'
alias listport='lsof -nP +c 15 | grep LISTEN'
export PATH="$HOME/bin:$PATH"
export GREP_OPTIONS='--color=auto'
alias docker-clean='docker volume rm $(docker volume ls -qf dangling=true)'
alias timezone='ls -l /etc/localtime| cut -d"/" -f8,9'
alias showhiddenfile='defaults write com.apple.Finder AppleShowAllFiles TRUE;killall Finder'
alias hidehiddenfile='defaults write com.apple.Finder AppleShowAllFiles FALSE;killall Finder'
alias cpanshell='sudo perl -MCPAN -e shell'
alias lsd="ls -d */"
alias reload="exec $SHELL -l"
alias py3="python3"
alias pl="perl"

git-latest-tag() {
    git ls-remote --tags $1 | sort -t '/' -k 3 -V | awk '{print $2}' | tail -n 1
}

git-f5() {
    arg="$1"
    git checkout main
    git branch -D "$arg"
    git pull
    git checkout "$arg"
}

git-conflict() {
    grep -rn '<<<<\|>>>>\|====' "$1"
}

tree() {

    arg="$1"
    find -s "$arg" -not -path '*/\.' -not -path '.git' -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

del() {
    mv "$1" ~/.Trash/
}

dockertags() {

    image="$1"

    tags=$( wget -q https://registry.hub.docker.com/v1/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}' )

    if [ -n "$2" ]
    then
        tags=$( echo "${tags}" | grep "$2")
    fi

    echo "${tags}"
}

d-restart() {
    echo "$@"
    docker compose stop "$@"
    docker compose rm -fv "$@"
    docker compose up -d "$@"
}

aws() {
    docker run --rm -v ~/.aws:/root/.aws:ro amazon/aws-cli "$@"
}
