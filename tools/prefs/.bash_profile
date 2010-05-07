if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
	. /usr/local/git/contrib/completion/git-completion.bash
	export PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
fi
 
export CLICOLOR=1
export FLEX_HOME="/Applications/Adobe Flash Builder 4/sdks/4.0.0"
export ANT_OPTS="-XX:MaxPermSize=128M -Xms128M -Xmx512M"
					   
alias sp='source ~/.bash_profile'
alias pe='vim ~/.bash_profile'
alias ls='ls -al'

set -o vi
