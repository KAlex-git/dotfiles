#!/usr//bin/sh
# ##
# #rsync -aAXv --delete --exclude={/home/kalex/home}
# ##
# ##
#
# [kalex@K2 ~]$ rsync -PxXaAzR /home/kalex/Documents phone | sed -e "s/.*pdf/${RED}&$(printf '\033[0m')/; s/.*jpg\|.*webm/$(printf '\033[0;32m')&$(printf '\033[0m')/; /xfr/s/^.*$//; /^$/d"

#
# ### TODO checking a start root previlegies
# if [[ $UID != 0 ]]; then
#     echo "Please run this script with sudo:"
#     echo "sudo $0 $*"
#     exit 1
# fi

UNC=$(printf '\033[0;33m')
RED=$(printf '\033[0;31m')
SYAN=$(printf '\033[0;36m')
YELL=$(printf '\033[0;32m')
NC=$(printf '\033[0m')

# DEST="/mnt/usb/Linux/Backup"
# RSYNC_OPTS="-aAXvuz"
RSYNC_OPTS="-PxXaAzRuz --delete"

SRC="
"$HOME/background.jpg"
"$HOME/.ViberPC"
"$HOME/.Xauthority"
"$HOME/.aegisub"
"$HOME/.bash_history"
"$HOME/.bash_logout"
"$HOME/.bash_profile"
"$HOME/.bashrc"
"$HOME/.config"
"$HOME/.fehbg"
"$HOME/.gitconfig"
"$HOME/.gitmodules"
"$HOME/.gnupg"
"$HOME/.gtkrc-2.0"
"$HOME/.librewolf"
"$HOME/.local"
"$HOME/.lyrics"
"$HOME/.mono"
"$HOME/.npm"
"$HOME/.pki"
"$HOME/.ssh"
"$HOME/.stardict"
"$HOME/.viminfo"
"$HOME/.xprofile"
"$HOME/.zoom"
"$HOME/.zprofile"
"$HOME/Develop"
"$HOME/Documents"
"$HOME/Downloads"
"$HOME/Music"
"$HOME/Pictures"
"$HOME/ViberDownloads"
"$HOME/Videos"
"$HOME/tmp"
"

DEST="/mnt/usb/Linux/Backup"

EXCLUDE=({
# 'drozd*'
#'Develop'
})

exclude_opts=()
for item in "${EXCLUDE[@]}"; do
    exclude_opts+=( --exclude="$item" )
done

rsync \
    ${RSYNC_OPTS} \
    ${exclude_opts[@]} \
    ${SRC[@]} \
    ${DEST} | \
    sed -e "s/sending incremental file list/${UNC}::RSYNC::${NC}/" \
        -e "s/.*pdf/${YELL}&${NC}/" \
        -e "s/.*jpg/${YELL}&${NC}/" \
        -e "s/.*mp3/${SYAN}&${NC}/" \
        -e "s/.*mp4\|.*avi\|.*flv\|.*webm/${PURPLE}&${NC}/" \
        -e "/xfr/s/^.*$//; /^$/d"





# sd="/mnt/usb"
# ### TODO
#
#
#
# ### TODO
# ### Finded storage mount and backup
# storage="$(sudo -A blkid | grep "5abfe5b6-03\|arch_arh" | awk '{print$1}' | sed 's/\://')"
#
# if [[ "$(blkid | grep -o "5abfe5b6-03")" == "5abfe5b6-03" ]]
# then
# 	if [[ -d /mnt/usb ]];then
#     backup
# 	else
# 		print "Create directory"
# 		sudo mkdir /mnt/usb
# 		notify-send "A finded storage '16GB' 'please one minute'"
# 		sudo mount "$storage" /mnt/usb
#     backup
# 	fi
# fi
