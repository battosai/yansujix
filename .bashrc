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
yansujix=~/Documents/GitHub/yansujix

dot_bashrc=~/.bashrc
dot_bash_profile=~/.bash_profile
dot_ssh=~/.ssh/config
dot_vimrc=~/.vimrc

alias bashrc="vim $dot_bashrc && source $dot_bashrc"
alias vimrc="vim $dot_vimrc"

function upload_dots() 
{
	cd $yansujix
	git fetch && git pull
	cp $dot_bashrc $yansujix/.bashrc
	cp $dot_bash_profile $yansujix/.bash_profile
	cp $dot_ssh $yansujix/.ssh/config
	cp $dot_vimrc $yansujix/.vimrc
	cp $dot_hyprland $yansujix/hypr/hyprland.conf
    cp $dot_waybar $yansujix/waybar/config.jsonc
    cp $css_waybar $yansujix/waybar/style.css
	cp $dot_kitty $yansujix/kitty/kitty.conf
    cp $dot_rofi $yansujix/rofi/config.rasi
    cp $dot_git $yansujix/.gitconfig
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
    git clone https://aur.archlinux.org/$1.git
    cd $1
    makepkg -sirc
}

# ===========================
# Hyprland
# ===========================
dot_hyprland=~/.config/hypr/hyprland.conf

alias hyprland_config="vim $dot_hyprland"

# ===========================
# Waybar
# ===========================
dot_waybar=~/.config/waybar/config.jsonc
css_waybar=~/.config/waybar/style.css

alias waybar_config="vim $dot_waybar && waybar_reload"
alias waybar_style="vim $css_waybar && waybar_reload"
alias waybar_reload="killall waybar 2>/dev/null || true && hyprctl dispatch exec waybar"

# ===========================
# Kitty
# ===========================
dot_kitty=~/.config/kitty/kitty.conf

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

# ===========================
# Rofi
# ===========================
dot_rofi=~/.config/rofi/config.rasi

alias rofi_config="vim $dot_rofi"

# ===========================
# Git
# ===========================
dot_git=~/.gitconfig

alias git_config="vim $dot_git"
