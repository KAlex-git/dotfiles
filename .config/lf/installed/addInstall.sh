#!/bin/sh
##
## Variable Color
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)
#
e_installed() { printf "\n${bold}${green}==========  %s  ==========${reset}\n" "$@" ;}
e_install() { printf "\n${bold}${tan}==========  %s  ==========${reset}\n" "$@" ;}

##
##
pack="mediainfo odt2txt highlight atool odt2txt w3m pdftotext catdoc docx2txt xlsx2csv hack-font-ligature-nerd-font-git"
pacman -Qq $pack || yay -S --needed $pack

pathfull="$(realpath "$0" | sed 's|\(.*\)/.*|\1|')"

if [[ -n /usr/bin/epub.thumbnailer ]]; then
    echo "installed epub.thumbnailer"
elif [[ -f "$pathfull/epub_thumb.tgz" ]]; then
cd "$pathfull";
tar -zxvf epub_thumb.tgz;
cd epub_thumb/; sudo python install.py install >/dev/null 2>&1;
cd ../;
printf "installed\n"
rm -rf ./epub_thumb
fi

[[ -e /usr/bin/ueberzug ]] || pip3 install ueberzug 1>/dev/null

e_installed "для того, чтобы 'icons' работали в lf-ueberzug необходимо
в 'st-kalex' главным шрифтом поставить
static char *font = {
    \"Hack Nerd Font:pixelsize=15:antialias=true:autohint=true\",
};

А, вторым:
static char *font2[] = {
    \"ico_kalex:pixelsize=15:antialias=true:autohint=true\",
};

они должны быть в /usr/local/share/fonts/
"
