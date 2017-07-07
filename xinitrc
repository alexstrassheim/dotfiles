if [ `hostname` == "lex" ]; then
    setxkbmap -layout us_intl -variant mac -option ctrl:nocaps
else
    setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps
fi
xinput set-prop 14 "Device Enabled" 0
source ~/.zshrc
nm-applet &
xset -dpms s off
exec awesome
