if [ `hostname` == "lex" ]; then
    setxkbmap -layout us_intl -variant mac -option ctrl:nocaps
else
    setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps
fi
nm-applet &
source ~/.zshrc
exec dbus-launch awesome
