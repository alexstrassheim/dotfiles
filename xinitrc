if [ `hostname` == "lex" ]; then
    setxkbmap -layout de -variant mac -option ctrl:nocaps
else
    setxkbmap -layout de -option ctrl:nocaps
fi
xrdb -I$HOME ~/.Xresources
nm-applet &
source ~/.zshrc
exec dbus-launch awesome
