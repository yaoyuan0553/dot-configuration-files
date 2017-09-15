# commands

# tabs
tabs -4

# set key repeat rate
xset r rate 500 35

# create a new executable script file with given name
mksc() {
	# check inputs 
	[[ $# -ne 2 ]] && { echo "Usage: <shebang interpreter name> <file name>" >&2; return 1; }
	local interp_path=$(which $1)
	[[ -x $interp_path ]] || { echo "Program '$1' is not installed, or is not in PATH" >&2; return 1; }
	[[ -f $2 ]] && { echo "File '$2' already exists" >&2; return 1; }
	echo '#!'$interp_path > $2;		# create file
	chmod +x $2;				# convert to executable
}

# create a new python 2 file
mkpy() {
	[[ $1 ]] || { echo "Missing file name" >&2; return 1; }
	mksc python $1;
}

# create a new python 3 file
mkpy3() {
	[[ $1 ]] || { echo "Missing file name" >&2; return 1; }
	mksc python3 $1;
}

# get public ip addr
alias show-public-ip='dig +short myip.opendns.com @resolver1.opendns.com'

# colored ls
alias ls='ls --color=auto'

# on Yuan-Desktop-Ubuntu
if [ $HOSTNAME = "yuyao-Ubuntu" ]; then
    # go to TAMU folder
    alias gotamu='cd /media/yuyao/Games/Temp-Documents/TAMU'
fi
