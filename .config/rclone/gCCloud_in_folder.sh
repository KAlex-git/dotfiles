cd $HOME/GDisk/RSL_Иллюстрации_к_служению/

/usr/bin/rclone sync --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s  "GDisk:RSL_Иллюстрации_к_служению" "/home/kalex/GDisk/RSL_Иллюстрации_к_служению/"
