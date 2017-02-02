if [ `hostname` == "lex" ]; then
    setxkbmap -layout us_intl -variant mac -option ctrl:nocaps
else
    setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps
fi
nm-applet &
xinput set-prop 14 "Device Enabled" 0
source ~/.zshrc
nm-applet &
exec awesome
