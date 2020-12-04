export SVN_EDITOR="vim"
source ~/perl5/perlbrew/etc/bashrc

alias c='clear'
alias x='exit'
alias p='pwd'
alias v='vim'
alias s='/usr/local/bin/svn'
alias pb='/Users/trieuv/perl5/perlbrew/bin/perlbrew'
alias g='/usr/local/bin/git'
alias gs='/usr/local/bin/git status'
alias gf='/usr/local/bin/git diff'
alias gb='/usr/local/bin/git branch'
alias glp='/usr/local/bin/git log -p'
alias glo='/usr/local/bin/git log --oneline'
alias profile='vim ~/.profile'
alias bashrc='vim ~/.bashrc'
alias ci='docker rmi -f $(docker images -f "dangling=true" -q )'
alias cv='docker volume rm -f $(docker volume ls -qf dangling=true)'
alias dsp='docker system prune'
alias d='docker-compose'
alias dm='docker-machine'
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

git-latest-tag() {
    git ls-remote --tags $1 | sort -t '/' -k 3 -V | awk '{print $2}' | tail -n 1
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

aws() {
    docker run --rm -v ~/.aws:/root/.aws:ro amazon/aws-cli "$@"
}
