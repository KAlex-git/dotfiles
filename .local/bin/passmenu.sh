#!/usr/bin/env zsh

# shopt -s nullglob globstar

typeit=0
# typeit=1
if [ "$(printf "%b\n" '--type' | grep -E -- "^$1$" | wc -l)" -eq 1 ]; then
	typeit=1
	# shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
# printf "%b\n" "$prefix" | dmenu
password_files="$( find "$prefix" -name "*.gpg" | sed "s|^$prefix/||" | \
    sed "s|.gpg$||")"
# password_files=( "${password_files[@]#"$prefix"/}" )
# password_files=( "${password_files[@]%.gpg}" )

password=$(printf "%b\n" "${password_files}" | dmenu -c -l 15 -i -p "Entry" -b)
# printf "%b\n" "$password"

[ -n "$password" ] || exit ; notify-send "PASS: .... $password .... " "Copied to clipboard (<a>timeout in 45 seconds</a>)" -i "dialog-password" -t 5000

if [ "$typeit" -eq 0 ]; then
	pass show -c "$password"
else
	pass show "$password" | { IFS= read -r pass; printf "%b\n" %s "$pass"; } |
		xdotool type --clearmodifiers --file - 
fi
