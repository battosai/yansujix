#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# ===========================
# Start SSH agent on boot
# ===========================
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
fi

# ===========================
# Yansujix
# ===========================
bashrc=~/.bashrc
bash_profile=~/.bash_profile
ssh_conf=~/.ssh/config
hyprland_conf=~/.config/hypr/hyprland.conf
kitty_conf=~/.config/kitty/kitty.conf

yansujix_repo=~/Documents/GitHub/yansujix

alias edit_bashrc="vim $bashrc && source $bashrc"
alias edit_hyprland="vim $hyprland_conf"
alias edit_kitty="vim $kitty_conf"

function change_kitty_theme()
{
	# Download the specified theme and make a symlink
	# Reference: https://github.com/dexpota/kitty-themes
	THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$1.conf
	wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
	ln -s ~/.config/kitty/kitty-themes/themes/$1.conf ~/.config/kitty/theme.conf
}

function upload_confs() 
{
	cd $yansujix_repo
	git fetch && git pull
	cp $bashrc $yansujix_repo/.bashrc
	cp $bash_profile $yansujix_repo/.bash_profile
	cp $ssh_conf $yansujix_repo/ssh_config
	cp $kitty_conf $yansujix_repo/kitty.conf
	cp $hyprland_conf $yansujix_repo/hyprland.conf
	git add .

	if [ $# -eq 0 ]; then
		git commit -m "update confs"
	else
		git commit -m "$*"
	fi

	git push
}

