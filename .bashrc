# .bashrc
# Git memo
#
# Commit
#   git commit -m "..."  .
#   git push origin master
#
# Uncommit
#   git reset   HEAD~
#   git rebase  HEAD~
#
# Put tag
#   git tag  0.0.1
#   git push --tags
#
# Untag
#   git tag  -d 0.0.1
#   git push  origin :refs/tags/0.0.1
#
# Move to the branch
#   ( git stash save branch-name )
#   ( git stash list )
#   ( git stash pop 'stash@{0}')
#   git checkout branch-name
#   git checkout branch-name -t 0.0.1
#
# Checkout remote branch to temporary local branch
#   git branch tmp origin/master
#   git checkout tmp
#    or
#   git checkout -b tmp origin/master
#
# Delete the branch
#   git branch -d branch-name
#


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="[\h \u:\w]\\$ "
#-----------------
# LANG
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG==en_US.UTF-8
export LANGUAGE==en_US.UTF-8
export EDITOR=vim
#-----------------
# Bash completion
export BASH_COMPLETION=~/workenv/bash_completion
export BASH_COMPLETION_DIR=~/workenv/bash_completion.d
export BASH_COMPLETION_COMPAT_DIR=/workenv/bash_completion.d
if [ -f $BASH_COMPLETION ]; then
    . $BASH_COMPLETION
fi
export GIT_COMPLETION=~/workenv/git/contrib/completion/git-completion.bash
if [ -f $GIT_COMPLETION ]; then
    . $GIT_COMPLETION
fi


#-----------------
# SSH-AGENT
#S_LINK_AUTH_SOCK=~/.ssh/auth_sock
#if [ $SSH_AUTH_SOCK ]; then
#    S_LINK_AUTH_SOCK_DATE=`ls -d -l --time-style='+%Y%m%d' ${S_LINK_AUTH_SOCK}  | awk '{print $6}'`
#    TODAY=`date +'%Y%m%d'`
#    if [ ! -L $S_LINK_AUTH_SOCK ] || [ ! -S `readlink $S_LINK_AUTH_SOCK` ] || [ ! "${TODAY}" = "${S_LINK_AUTH_SOCK_DATE}" ]; then
#	rm -f $S_LINK_AUTH_SOCK
#	ln -s $SSH_AUTH_SOCK $S_LINK_AUTH_SOCK
#    fi
#fi
#export SSH_AUTH_SOCK=$S_LINK_AUTH_SOCK
# History
export HISTSIZE=100000
export HISTFILESIZE=100000
#-----------------
# http_proxy
if [ -f ~/etc/proxy ]; then
    . proxy
fi
#-----------------
# tsocks
export TSOCKS_CONF_FILE=~/env/tsocks.conf

#-----------
# python
#export PYTHON_HOME=/usr/local/python-2.6.6
#export PATH=${PYTHON_HOME}/bin:${PATH}
#-----------
# php
#export PHP_HOME=/usr/local/php
#export PATH=${PHP_HOME}/bin:${PATH}
#-----------
# java
#export JAVA_HOME=/usr/java/jdk
#export PATH=${JAVA_HOME}/bin:${PATH}
#export HADOOP_HOME=/usr/local/hadoop
#export PATH=${HADOOP_HOME}/bin:${PATH}
#export MAHOUT_HOME=/usr/local/mahout
#export PATH=${MAHOUT_HOME}/bin:${PATH}
#-----------
# ant
#export ANT_HOME=/usr/local/apache-ant
#export PATH=${ANT_HOME}/bin:${PATH}
#export MANPATH=${ANT_HOME}/man:$MANPATH
#-----------
# mvn
#  mvn install:install-file -DgroupId=org.apache.lucene -DartifactId=lucene-gosen-ipdic -Dversion=2.0.2 -Dpackaging=jar -Dfile=lucene-gosen-2.0.2-ipadic.jar
#  mvn archetype:create -DgroupId=jp.crumb -DartifactId=sample-web -DarchetypeArtifactId=maven-archetype-webapp
#  mvn archetype:create -DgroupId=jp.crumb -DartifactId=sample-jar -DarchetypeArtifactId=maven-archetype-quickstart
#  mvn eclipse:eclipse
#  mvn dependency:copy-dependencies
#  mvn assembly:assembly
#export MVN_HOME=/usr/local/apache-maven
#export PATH=${MVN_HOME}/bin:${PATH}
#export MANPATH=${MVN_HOME}/man:$MANPATH
#-----------
# jmeter
# export JMETER_HOME=/usr/local/jmeter
# export PATH=${JMETER_HOME}/bin:${PATH}
# export MANPATH=${JMETER_HOME}/man:$MANPATH
#-----------
# custom openssl
# export OPENSSL_HOME=/usr/local/ssl
# export PATH=${OPENSSL_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${OPENSSL_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${OPENSSL_HOME}/man:$MANPATH
#-----------
# postgres
# export POSTGRES_HOME=/usr/local/pgsql
# export PATH=${POSTGRES_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${POSTGRES_HOME}/lib:$LD_LIBRARY_PATH
# export PGDATA=${POSTGRES_HOME}/data
# export MANPATH=${POSTGRES_HOME}/man:$MANPATH
#-----------
# mysql
# export MYSQL_UNIX_PORT=/usr/local/mysql/mysql.sock
# export MYSQL_HOME=/usr/local/mysql
# export PATH=${MYSQL_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${MYSQL_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${MYSQL_HOME}/man:$MANPATH
#-----------
# apache
# export APACHE_HOME=/usr/local/apache2
# export PATH=${APACHE_HOME}/bin:${PATH}
# export LD_LIBRARY_PATH=${APACHE_HOME}/lib:$LD_LIBRARY_PATH
# export MANPATH=${APACHE_HOME}/man:$MANPATH
#-----------
# cvs
# export CVSROOT=:ext:uesr@hostname:/path/to/cvs
# export CVS_RSH=ssh
# export CVSROOT=:pserver:user@hostname
#-----------
# gtags ( $ cd ?? ; gtags ~/.gtags )
# export GTAGSROOT=/usr/include
# export GTAGSDBPATH=~/.gtags

# Oracle
# export ORACLE_HOME=/usr/local/instantclient_11_1
# export TNS_ADMIN=${ORACLE_HOME}
# export PATH=$ORACLE_HOME:$PATH
# export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH

#----------------
# path
export MANPATH=~/sfw/man:/usr/local/man:$MANPATH
export PATH=~/sfw/sbin:~/sfw/bin:$PATH
export LD_LIBRARY_PATH=~/sfw/lib:$LD_LIBRARY_PATH:/usr/local/lib
export PATH=/Applications/Emacs.app/Contents/MacOS:${PATH}

source ~/.env
alias emacs=Emacs
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#peco-select-history() {
#  declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "")
#  READLINE_LINE="$l"
#  READLINE_POINT=${#l}
#  if [ -n "$READLINE_LINE" ] ; then
#    # Replace the last entry, "peco-history", with $READLINE_LINE
#    history -s $READLINE_LINE
#
#    if type osascript > /dev/null 2>&1 ; then
#      # Send UP keystroke to console
#      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
#    fi
#
#    # Uncomment below to execute it here directly
#    # echo $READLINE_LINE >&2
#    # eval $READLINE_LINE
#	fi
#}
#bind -x '"\C-r": peco-select-history'
#bind    '"\C-xr": reverse-search-history'

export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export PATH=~/.nodenv/bin:$PATH
eval "$(nodenv init -)"
export PATH=~/.pyenv/bin:$PATH
eval "$(pyenv init -)"

export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

export PATH="/Users/kubota/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
eval $(docker-machine env)
