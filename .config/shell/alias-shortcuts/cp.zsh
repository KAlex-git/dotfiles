#Show progress while file is copying

# Rsync options are:
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
#  -- - everything after this is an argument, even if it looks like an option

alias cpv="rsync -rpoghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

c(){
    _start "идёт процесс копирования"
    cpg -g "$1" "$2" &&\
    _done "done" ||\
    clear
    _error "поздравляю 😠; ты попал"
}
m(){
    _start "идёт процесс перемещения"
    mvg -g "$1" "$2" &&\
    _done "done" ||\
    clear
    _error "поздравляю 😠; ты попал"
}
##
## bak - backup selected file
# usage: bak <filename>
   bak()
   {
       cp $1{,.bak}
   }

alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -arvzu --delete --progress -h"


## -- copy | move files and directories ------------------
#   cf() { cp -av "$1" "$(awk '{print $2}' ~/.config/shell/bm-dirs | fzf | sed "s|~|$HOME|")" ;}
#   mf() { mv -v "$1" "$(awk '{print $2}' ~/.config/shell/bm-dirs | fzf | sed "s|~|$HOME|")" ;}
#


## copy path folder
   yp()
   {
		fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		 echo $fullpath  | xclip -selection c
		 echo
		 echo -e "path was copied ...FULL  \n $(xclip -selection c -o) "
		 echo
   }


## copy name folder \ files
   yn()
   {
	fname=`basename ${1:-.}`
	echo $fname | xclip -selection clipboard
   }



###########################
##pbcopy(){ xclip -selection clipboard ;}
##pbpaste(){ xclip -out -selection clipboard ;}
