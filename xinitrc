setxkbmap -layout de -variant mac -option ctrl:nocaps &
xbindkeys &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &
export SSH_AUTH_SOCK &
xrdb -I$HOME ~/.Xresources &
nm-applet &
exec dbus-launch awesome
