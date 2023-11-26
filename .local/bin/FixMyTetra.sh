## Minimized current window
## windowmap - activate window

if [[ $(pidof mytetra) ]];then


check="$(wmctrl -lx | grep 'mytetra')"

if [[ ! -z $check ]];then 
	for LINE in $(xdotool search --class mytetra); do
	  $(xdotool windowunmap --sync $LINE)
  done
else
	for LINE in $(xdotool search --class mytetra); do
	  $(xdotool windowmap --sync $LINE)
  done
fi

else
	notify-send -i '/usr/share/icons/hicolor/48x48/apps/mytetra.png' 'mytetra'; mytetra
fi
