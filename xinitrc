setxkbmap -layout us -variant altgr-intl -option nodeadkey compose:nomenu ctrl:nocaps
xinput set-prop 10 "Device Enabled" 0
source ~/.zshrc
nm-applet &
exec awesome
