# .xinitrc

# Global xinit
. /etc/X11/Xsession

# PA sound
/usr/bin/start-pulseaudio-x11

xrandr -s 0

xrdb $HOME/.Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'

# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ];
then
	eval `ssh-agent -s`
	ssh-add < /dev/null
fi

xset fp+ /usr/local/lib/X11/fonts/terminus
xset fp+ /usr/local/lib/X11/fonts/ghostscript
xset fp+ /usr/X11R6/lib/X11/fonts/TTF/

# xset fp rehash
xset b 100 0 0
xset r rate 140 200

xmodmap -e "keycode 233 = Page_Down"
xmodmap -e "keycode 234 = Page_Up"
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

xmonad &

