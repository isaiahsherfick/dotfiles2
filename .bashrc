# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
PS1='\[\e[92m\]\u\[\e[0m\]@\[\e[96m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"')\[\e[38;5;168m\]\w\[\e[0m\]\\$ '
export MANPAGER="nvim +Man!"
alias rl="source ~/.bashrc"
alias vim="nvim"
alias g="cd ~/git"
alias vr="nvim ~/.config/nvim/init.vim"
alias tm="tmux"
alias b="vim ~/.bashrc"
alias br="b"
alias grep="rg"
alias ls="ls --color=always"
