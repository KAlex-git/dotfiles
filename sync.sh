#!/usr/bin/env bash

# Текущий каталог
#REPO_DIR=$(cd "${BASH_SOURCE%/*}/.." && pwd) # This is a $HOME directory

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo ".")")" && pwd)"
LOGFILE="$REPO_DIR/LOG_Sync.log"

notify-send "Sync github to local ..." "$REPO_ROOT"

# функции
log(){
  echo "$(date +""%d.%m.%Y\ %T"") === $@"
}

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

log Command \"git pull\"
git pull -s recursive

log Command \"git push\"
git push



