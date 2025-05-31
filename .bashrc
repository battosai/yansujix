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
dot_bashrc=~/.bashrc
dot_bash_profile=~/.bash_profile
dot_ssh=~/.ssh/config
dot_vimrc=~/.vimrc
dot_hyprland=~/.config/hypr/hyprland.conf
dot_waybar=~/.config/waybar/config.jsonc
css_waybar=~/.config/waybar/style.css
dot_kitty=~/.config/kitty/kitty.conf

yansujix=~/Documents/GitHub/yansujix

alias bashrc="vim $dot_bashrc && source $dot_bashrc"
alias vimrc="vim $dot_vimrc"
alias hyprland_config="vim $dot_hyprland"
alias waybar_config="vim $dot_waybar"
alias waybar_style="vim $css_waybar"
alias waybar_reload="pkill waybar && hyprctl dispatch exec waybar"
alias kitty_config="vim $dot_kitty"

function get_kitty_theme()
{
	# Download the specified theme and make a symlink
	# Reference: https://github.com/dexpota/kitty-themes
	THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$1.conf
	wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
}

function set_kitty_theme()
{
    rm ~/.config/kitty/theme.conf
    ln -s ~/.config/kitty/kitty-themes/themes/$1.conf ~/.config/kitty/theme.conf
}

function upload_dots() 
{
	cd $yansujix
	git fetch && git pull
	cp $dot_bashrc $yansujix/.bashrc
	cp $dot_bash_profile $yansujix/.bash_profile
	cp $dot_ssh $yansujix/.ssh/config
	cp $dot_vimrc $yansujix/.vimrc
	cp $dot_kitty $yansujix/kitty/kitty.conf
    cp $dot_waybar $yansujix/waybar/config.jsonc
	cp $dot_hyprland $yansujix/hypr/hyprland.conf
	git add .

	if [ $# -eq 0 ]; then
		git commit -m "update confs"
	else
		git commit -m "$*"
	fi

	git push
}

function aur_install()
{
    cd ~/Downloads
    git clone $2
    cd $1
    makepkg -sirc
}
