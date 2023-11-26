#!/usr/bin/sh
#

# File connention {{{
_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"

DMENU="dmenu -i -l 20 -p"
srcdwm="$HOME/.local/src/dwm"


# show-help() {
#     padding="......................................"
#     printf "==== HelpPage OF CONTENTS =====\n"
#     title="--help"
#     printf "%s%s %s\n" "$title" "${padding:${#title}}" " This is help Page"
#     title="--up"
#     printf "%s%s %s\n" "$title" "${padding:${#title}}" " backup qutebrowser"
# }

function HelpPage()
{
    padding="......................................"
    printf "==== HelpPage OF CONTENTS =====\n"
    title="--help"
    printf "%s%s %s\n" "$title" "${padding:${#title}}" "This is help Page"
    title="--up"
    printf "%s%s %s\n" "$title" "${padding:${#title}}" "install default browser in system"
}    # ----------  end of function usage  ----------

change_default_browser() {
options=("brave"
"librewolf"
"Opera")

choice=$(printf '%s\n' "${options[@]}" | ${DMENU} 'Choose default browser:' "${@}")

if [ "$choice" ]; then
    sed -i '/export BROWSER=/ s/"\(.*\)"/"\l'${choice}'"/' $HOME/.config/shell/profile
    cd "$HOME/.config/shell" ; source profile

    sed -i '/id=/ s/*\([A-Za-z]\+\)/\*'${choice}'/' $HOME/.config/dmscripts/copylinkBrowser

      
    cd $HOME/.local/src/dwm
    sed -i '\:define BROWSER: s:[A-Za-z]\+.png:\l'${choice}.png':' config.h
    sed -i '/bookmenu.*browser/ s/"-co", "\(.*\)"/"-co", "\l'${choice}'"/' config.h
    sudo -A make install
    sleep 3s
    kill -HUP $(pgrep -u $USER "dwm$")
else
  echo "Program terminated." && exit 0
fi
}


if [[ -z "$1" ]]; then
     echo " Try '--help' "
     HelpPage
     exit 1
fi

if [[ "$1" == "--help" ]]; then
     HelpPage
     exit
fi

if [[ "$1"  == "--up" ]];then
   change_default_browser
fi
