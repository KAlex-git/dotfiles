#!/usr/bin/env zsh
# Author Haron Prime
# License - © 2017 WTFPL - http://www.wtfpl.net/

# мои альясы
# my aliases

alias sctl='systemctl'
alias ssctl='sudo systemctl'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias srestart='sudo systemctl restart'
alias senable='sudo systemctl enable'
alias sdisable='sudo systemctl disable'
alias sdaemon='sudo systemctl daemon-reload'
alias sstatus='sudo systemctl status'
alias sctlu='systemctl --user'
alias startu='systemctl --user start'
alias stopu='systemctl --user stop'
alias restartu='systemctl --user restart'
alias enableu='systemctl --user enable'
alias disableu='systemctl --user disable'
alias daemonu='systemctl --user daemon-reload'
alias statusu='systemctl --user status'

alias jctl='journalctl'
alias jctlb='journalctl -b'
alias jctlf='journalctl -f'
alias jctlerr='journalctl -b -p3 g'
alias jctlc='sudo journalctl --vacuum-size=20000'

alias dump='sudo screendump > $HOME/output.txt'
alias psc='ps xawf -eo pid,user,cgroup,args'
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'

alias ipt='iptables -L -vn'
alias vnspeed='vnstat -l -i enp3s0'
#alias nout='ssh haron@192.168.0.11 -p 232'

alias wget='wget -c --progress=bar'
ards(){
	printf "скачивание пакета из репозитория в Downloads, без установки\n\n"
	yay -Sp "$1" | aria2c -i -
}

alias tv='mpv --playlist=$HOME/Video/Playlists/multinet-play.m3u'
alias asm='acestream-launcher --player mpv'
alias asv='acestream-launcher --player vlc'
alias scast='ffmpeg -f x11grab -s 1920x1080 -r 25 -i :0.0 -vcodec libx264 -b 700K ~/Video/Screencast/$(date +"%d.%m.%Y_%H:%M:%S").mkv'

alias gzip='tar -cvzf'
alias bzip='tar -cvjf'

alias crypt='gpg -c --cipher-algo AES256'
alias uncrypt='gpg  $1'

alias cclean='yay -Sc'
alias pclean='sudo pacman -Rns $(pacman -Qtdq)'
# alias pacfs='pacman -Fs'
alias pacfs='pacman -Qo'
# alias mirrorlist='sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist'


alias weather='curl -H "Accept-Language: ru" wttr.in'



# my git aliases
# alias gl='git log'
#alias gstat='git status'
#alias gadd='git add'
#alias gi='git add -i'
#alias gcom='git commit -m "Update"'
#alias gpush='git push'
## alias gfull='git add --all && git commit -m "Update" && git push'
#alias gch='git checkout'
#alias gcd='git checkout develop'
#alias gcm='git checkout master'
#alias gmf='git merge --no-ff -m "Update"'
#alias GF='git add --all && git commit -m "Update" && git push'
#alias BS='git checkout master && git merge --no-ff -m "Update" develop && git push && git checkout develop'
#alias GU='mcf && GF && gsync && bb && GF && ggsync && gl && GF && mcf'

# глобальные альясы zsh
# global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM='/var/log/messages'
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'
alias -g g="| grep"
alias -g l="| less"
alias -g C='| wc -l'

# другие альясы
# other aliases
alias grep='grep --colour=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias rmr='nocorrect rm -iR'
alias rmf='nocorrect rm -if'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'

alias -s {avi,mpeg,mpg,mov,m2v,mkv}=mpv
alias -s {odt,doc,sxw,rtf}=libreoffice
alias -s {png,gif,jpg,jpeg}=feh
alias -s text=vim

# alias P16S='rsync -ruptgo --delete --progress /home/haron/.local/lib/Pro100-5.20-GIV /media/16GB/Pro100-5.20-GIV/'
# alias P8S='rsync -ruptgo --delete --progress /home/haron/.local/lib/Pro100-5.20-GIV /media/8GB/Pro100-5.20-GIV/'
