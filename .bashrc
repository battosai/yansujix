#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# ===========================
# Bash
# ===========================
bashrc=~/.bashrc
bash_profile=~/.bash_profile

# ===========================
# SSH 
# ===========================
ssh_conf=~/.ssh/config

# Starts an agent on bootup
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
fi

# ===========================
# Hyprland
# ===========================
hyprland_conf=~/.config/hypr/hyprland.conf
kitty_conf=~/.config/kitty/kitty.conf
alias edit_hyprland="vim $hyprland_conf"
alias edit_kitty="vim $kitty_conf"

# ===========================
# Yansujix
# ===========================
yansujix_repo=~/Documents/GitHub/yansujix

function upload_confs() 
{
	cd $yansujix_repo
	git fetch && git pull
	cp $bashrc $yansujix_repo/.bashrc
	cp $bash_profile $yansujix_repo/.bash_profile
	cp $ssh_conf $yansujix_repo/ssh_config
	cp $kitty_conf $yansujix_repo/kitty.conf
	cp $hyprland_conf $yansujix_repo/hyprland.conf
	cp 
	git add .

	if [ $# -eq 0 ]; then
		git commit -m "update confs"
	else
		git commit -m "$*"
	fi

	git push
}

