# set vi mode
set -o vi

# let there be color in grep!
# export GREP_OPTIONS=' — color=auto'

# set Vim as my default editor
export EDITOR=vim

# set PS1, uname@cmputer:[path]
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# \$(parse_git_branch)\[\033[00m\] gives git branch name and color

PS1="\u@\h:\[\e[36m\]\[\e[1m\][\w]\[\e[0m\]"\
"\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ " 

# give me colors
alias ls='ls -G'
alias ll='ls -laiG'

# easy extraction
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# get git svn to work on macOS
export PERL5LIB=/usr/local/lib/perl5/site_perl/5.34.0/darwin-thread-multi-2level
export GITPERLLIB="/usr/local/opt/git/share/perl5:$(echo /usr/local/opt/subversion/lib/perl5/site_perl/*/darwin-thread-multi-2level)"

# get Jekyll to work
export SDKROOT=$(xcrun --show-sdk-path)
