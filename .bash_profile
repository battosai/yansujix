#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Opens the uwsm compositor selection menu after login
# if uwsm check may-start && uwsm select; then
#	exec uwsm start default
# fi

# Bypasses the compositor selection menu and
# launches Hyprland directly
if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi
