#!/usr/bin/sh

#
#   Удаляем файл только из репозитория, а физически файл сохранится на диске
#                                  и
#   Если же логи уже отслеживаются git’ом, то можно их оттуда убрать:
# 1. Добавьте файл в .gitignore
# 2. git commit -am "Message"
# git push origin {branch name}  or git push
#
#
#  /* Example */
# сat .gitignore
# $ scripts/*.log
#
# git rm --cached scripts/*.log
# git commit -am "Message"
# git push

# Set Colors
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

# Copy file in current folder
#
function echo_title() {     echo -ne "\033[1;44;37m${*}\033[0m\n"; }
function echo_success() {   echo -ne "\033[0;32m${*}\033[0m\n"; }
function splash() {
    local hr
    hr=" **$(printf "%${#1}s" | tr ' ' '*')** "
    echo_title "${hr}"
    echo_title " * $1 * "
    echo_title "${hr}"
    echo
}

__BACKUP_Local_Config__(){
local UNC=$(printf '\033[0;33m')
local YELL=$(printf '\033[0;32m')
local NC=$(printf '\033[0m')

 # local RSYNC_OPTS="-n"
# local RSYNC_OPTS="-aAXvuz --delete"
local RSYNC_OPTS="-aAXvuz"

splash "Copy $HOME/.local/{bin,src}\nAnd copy $HOME/.local/share/{larbs,icons,fonts,nvim}"
sleep 3s

SRC="
"$HOME/.bashrc"
"$HOME/.config"
"$HOME/.librewolf"
"$HOME/.local"
"$HOME/.stardict"
"

EXCLUDE=({
"lib/"
"*.rst"
"src/"
"state/"
"profanity/"
"zathura/"
"xorg/"
"stig/"
"stardict/"
"mime/"
"share/password-store/"
"share/pnpm/"
"wineprefixes/"
"share/TelegramDesktop/"
"man/"
"lf/"
"inxi/"
"gegl*"
"desktop-directories/"
"*Foliate"
"*Watchtower*"
"opera/"
"ru.webhamster.mytetra/"
"Subtitle*/"
"nvim*/"
"cef_user_data*/"
"*Organization/"
"WebCord/"
})


exclude_opts=()
for item in "${EXCLUDE[@]}"; do
    exclude_opts+=( --exclude="$item" )
done

local DEST="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"


rsync \
    ${RSYNC_OPTS} \
    ${exclude_opts[@]} \
    ${SRC[@]} \
    ${DEST} | \
    sed -e "s/sending incremental file list/${UNC}::RSYNC::${NC}/" \
        -e "s/.*pdf/${YELL}&${NC}/" \
        -e "s/.*jpg\|.*webm/${YELL}&${NC}/" \
        -e "/xfr/s/^.*$//; /^$/d"

}


function __BACKUP_BROWSER__ {
log "Backup Opera and Brave Browser"
cd $HOME/.config
tar -czvf opera-browser-backup.tar.gz "$HOME"/.config/opera
mv opera-browser-backup.tar.gz $REPO_DIR/.config
# tar -czvf brave-browser-backup.tar.gz "$HOME"/.config/BraveSoftware
  # tar -C /usr/share/icons/ -xjvf /tmp/$choice
}

#################################################################################################
# Текущий каталог
#REPO_DIR=$(cd "${BASH_SOURCE%/*}/.." && pwd) # This is a $HOME directory

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"
LOGFILE="$REPO_DIR/LOG_Sync.log"

notify-send "Sync github to local ..." "$REPO_ROOT"

# функции
log(){
  echo "$(date +""%d.%m.%Y\ %T"") === $@"
}

function log {
  local LINE="$bold$purple[arch-linux-install] $* $reset"
  echo "$LINE"
  echo "${LINE//?/-}"
}

# __BACKUP_BROWSER__

__BACKUP_Local_Config__

# перенаправляем вывод
exec 2>>$LOGFILE 1>>$LOGFILE

# вступление
echo ""
log "==============================================="
log "Changes from Linux"


# выполнение команд
log Command \"cd $REPO_DIR\"
cd $REPO_DIR

log Command \"git diff\"
git diff --name-status

log Command \"git add .\"
git add .

log Command \"git commit\"
curdate=$(date +"%d.%m.%Y %T")
git commit -a -v -m "Changes from Linux - $curdate"

# log Command \"git pull\"
# git pull -s recursive

log Command \"git push\"
git push && notify-send "Sync github to local ..." "Done"
