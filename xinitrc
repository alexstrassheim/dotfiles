setxkbmap -layout de -variant mac -option ctrl:nocaps &
xbindkeys &
xrdb -I$HOME ~/.Xresources &
nm-applet &
exec dbus-launch awesome
