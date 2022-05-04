# proxy
# export http_proxy="http://127.0.0.1:8888"
# export https_proxy="http://127.0.0.1:8888"
# export http_proxy="http://127.0.0.1:41091"
# export https_proxy="http://127.0.0.1:41091"
# export http_proxy="http://0.0.0.0:58591"
# export https_proxy="http://0.0.0.0:58591"
# commands

# tabs
tabs -4

_split_path_filename() {
    _path=$(dirname "${1}")
    _filename=$(basename -- "${1}")
}

_split_filename_extension() {
    _split_path_filename "${1}"
    _extension="${_filename##*.}"
    _filename="${_filename%.*}"
}

# converting webm, mp4, andn mp3 files
webm2mp4() {
    _split_filename_extension "${1}"
    [[ $_extension != "webm" ]] && { echo "Error: not a valid .webm file" >&2; return 1; }
    ffmpeg -i "$_path/$_filename".webm -qscale 0 "$_path/$_filename".mp4
}

mp42mp3() {
    _split_filename_extension "${1}"
    [[ $_extension != "mp4" ]] && { echo "Error: not a valid .mp4 file" >&2; return 1; }
    ffmpeg -i "$_path/$_filename".mp4 "$_path/$_filename".mp3
}

webm2mp3() {
    webm2mp4 "${1}"
    mp42mp3 "$_dir/$_filename".mp4
    rm "$_dir/$_filename".mp4
}

add-ssh-key() {
    cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'
}

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

# swap 2 file names
swap_files() {
    if [ $# -ne 2 ]
    then
        printf "Usage: swap_files file1 file2\n" > /dev/stderr
    else
        file1_dir=${1%/*}
        # just in case there were no slashes removed, assume cwd
        if [ "$file1_dir" = "$1" ]; then
            file1_dir="."
        fi

        tmpfile=$(mktemp -p "$file1_dir" )

        mv -- "$1" "$tmpfile"
        mv -- "$2" "$1"
        mv -- "$tmpfile" "$2"
    fi
}

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
cbf() { cat "$1" | cb; }
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"
# Copy current working directory
alias cbwd="pwd | cb"
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"

## aliases
# get public ip addr
alias show-public-ip='dig +short myip.opendns.com @resolver1.opendns.com'

# open files from terminal with default program
alias o='xdg-open'

alias vimrc="vim $HOME/.vimrc"

export PATH="$PATH:/media/yuan/Samsung_T5/Downloads"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.npm/bin:$PATH"
export PATH="/usr/bin/v2ray:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/cmake/cmake-3.16.4-Linux-x86_64/bin:$PATH"
export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PAGER="most"
export MANPATH="$MANPATH:/usr/local/texlive/2020/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2020/texmf-dist/doc/info"

export EDITOR="/usr/bin/vim"

# alias HP="http_proxy=http://127.0.0.1:58591"
# alias HPS="https_proxy=http://127.0.0.1:58591"

# alias tmux="env TERM=screen-256color tmux"

alias vimrc="vim $HOME/.vimrc"

if grep -iq Microsoft /proc/version; then
    export DISPLAY=$(ipconfig.exe | grep "vEthernet (WSL)" -A 3 | grep "IPv4 Address" | tr -d "\r" | awk '{print $NF":0.0"; exit;}')
    export LIBGL_ALWAYS_INDIRECT=1
else
    :
fi

if [ -d "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi
