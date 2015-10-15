/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
gnome-keyring-deamon &
if [ `hostname` == "lex" ]; then
    setxkbmap -layout de -variant mac -option ctrl:nocaps &
else
    setxkbmap -layout de -option ctrl:nocaps &
fi
xrdb -I$HOME ~/.Xresources &
xbindkeys &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source ~/.zshrc
nm-applet &
exec dbus-launch awesome
