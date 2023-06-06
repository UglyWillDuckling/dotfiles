#!/usr/bin/env bash
### PHP ###
dk-debug-shell-php()
{
    if [ -z "$1" ]
    then
	echo "You must pass say what is the script to run";
	exit 0;
    fi

    # echo "This will start the debug for the file $1"
    docker-compose exec phpfpm sh -c "export XDEBUG_MODE=profiler XDEBUG_SESSION=1 XDEBUG_OUTPUT_DIR='/var/www/html/'; export PHP_IDE_CONFIG='serverName=aap-publisher.local'; php $1"
}

lock_diff() {
    git diff composer.lock | grep "\+.*version" -B 2 | grep name
}
composer_list_required() {
    # needs to be run inside a composer project that contains a composer.json
    < composer.json jq '.require' | sed '1d;$d;' | awk '{print $1}' | sed 's/"|://g'
}

composer_list_updated() {
    # needs to run in a folder that contains a composer lock file
    git diff composer.lock | grep "\+.*version" -B 2 | grep name | awk '{ print $2}' | sed 's/"|,//g'
}
php_extract_classes () {
    while read file_path; do echo $(/usr/bin/grep -Po '^namespace\K.*[^;]' $file_path)'\'$(basename $file_path .php); done
}
php_classes_find () {
    fdfind -t f 'php$' -I $* | xargs grep class -l | php_extract_classes
}
### PHP ###

### GIT ###
git-select () { git diff --name-only "$@" | fzf -m }
git-diffselect () { git diff `git-select` }
branches-clean() {
    git branch --merged | grep -v `git branch --show-current` | while read branch; do git branch -d $branch; done
}
git-files_between_revs () {
    git diff $1..$2 | grep --color=auto -E "^diff" | cut -d " " -f3 | sed -E 's/^a\///'
}
github_filter_commit_php_files () {
    # get the php files from the GitHub commit page
    grep --color=auto -E "\.php" | pup 'span[data-filterable-item-text=""] text{}'
}
### GIT ###

### TEXT EDITTING ###
trim_start () {
    sed -E "s/^$1//"
}
trim_end () {
    sed -E "s/$1\$//"
}
trim_both () {
    trim_end "$1" | trim_start "$1"
}
replace_separator () {
    awk 'BEGIN {FS="'"$1"'"; OFS="'"$2"'"} {$1=$1; print $0}'
}
filter_empty() { awk 'NF'; }
remove_empty_lines() { filter_empty }
add_every_other_nl() {
    perl -pe 'print "\n" if ($.%2==1 && $.>1);'
}
replace_nl () {
    tr "
    " "$1"
}
urldecode() { php -R 'echo urldecode($argn)."\n";' }

log_find_order_state_change() { find . -name '*.gz' -mtime -200 | grep system | sort | xargs zcat  | grep -e "State Handler" | grep closed | awk '{print $17}' | sed 's/^/"/' | sed 's/$/",/'; }
log_find_call_on_null () { cat system.log | grep -e "getValue() on null" -A 2 | grep getCalculator | sort -u | awk -F\' '{print $2","}'; }
log_find_call_on_null_allsystem () { find . -name "system.log*.gz" -printf "%T+\t%p\n" | sort | awk '{print $2}' | xargs grep -e "getValue() on null"; }
file_open() { fd --type f $2 $1 |  rofi -keep-right -dmenu -i -p Docs | read file; xdg-open $file 2>/dev/null; }

emojis() {
    echo $(bat ~/.oh-my-zsh/plugins/emoji/emoji-char-definitions.zsh | tail +25 | awk 'BEGIN{ FS="=" } {print $2}' | head -n 200 | xargs | sed "s/\\$/\$\'/g" | sed "s/\s/' /g" | sed "s/$/\'/" | sed -E "s/\\$|'//g")
}
random_emojis () {
    for i in {1..200}
    do
	random_emoji $1
    done | xargs
}

### TEXT EDITTING ###
alias first='head -1'
alias collapse_spaces="sed 's/\s+/ /g'"
## TEXT EDITTING ###

### FILES ###
vif () {
    local fname
    fname=$(fzf) || return
    vim "$fname"
}
bindkey -s '^o' 'vif^M'
### FILES ###

### ALIASES ###
alias reload='_omz::reload'
alias b="bat"
alias ll="ls --color -lhF --group-directories-first"
alias l="ls --color -lAhF --group-directories-first"
alias msl='bin/mutagen-sync_list'
alias tolower="awk '{print tolower($0)}'"
alias open='xdg-open >/dev/null 2>/dev/null'
alias grep='grep --color=auto -E'
alias sed='sed -E'
alias diff='diff --color'
alias j='jobs -l'
alias upgrade='sudo apt-get update; sudo apt-get upgrade; sudo flatpak update; sudo flatpak remove --unused; sudo snap refresh;'
alias arch_pgrade='sudo pacman -Syu'
alias linux_version='uname -srm'
alias xdebug_staging='php -c /etc/platform/uut3dca33gxuq_stg/php.xdebug.ini -d xdebug.profiler_enable=On  bin/magento'
alias h='highlight'
alias remove_color_codes='sed -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g"'
alias rm-colors='sed -r "s/\x1B\[(([0-9]+)(;[0-9]+)*)?[m,K,H,f,J]//g"'
alias suderbobo='sponge'
alias hyper='hyperfine'
alias cpath='copypath'
alias gt='git'
alias run='rofi -show drun 2>/dev/null'
alias batman='man bat'
alias bat_empty='bat --style="header"'
alias .l="ls -lhGgod ./*"
alias wbs='web-search'
alias gi='git'
alias dockerps_names='docker ps --format '{{.Names}}''
alias 1pass='open https://monsoonconsulting.1password.com/home'
alias k1='kill -9 %1'
alias k2='kill -9 %2'
alias k3='kill -9 %3'
alias w="which"
alias push="git push"
alias pu="git push"
alias pull="git pull"
alias commit="git commit"
alias st="git status"
alias d="git diff"
alias v="vim"

hour=`date +%H`
if [[ $hour -lt 21 && $hour -gt 7 ]]; then
else
    alias bat="bat --theme 'Monokai Extended Origin'"
fi
# ALIAS END #

if [ -x "$(command -v fdfind)" ]
then
    alias fd='fdfind'
fi

if [ -x "$(command -v find_files)" ]
then
    alias fdoc='find_files "pdf|md"'
fi

alias pi='bc -l <<< "scale=10; 4*a(1);"'

ascii2pdf_and_open() { a2ps -o - | ps2pdf - |okular - 2>/dev/null}
null() { cat > /dev/null 2>&1}
prepend_to() {  sed "s/^/$1/" }
trim_whitespace_start() { sed -e 's/^[[:space:]]*//' }
trim_all() { sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' }

magento_trace_format() {
    sed 's/^#[0-9]* //' | grep -v "closure\|___callParent\|___callPlugins" | awk '{print $0 "\n|"}' | awk '{ printf("%*s\n", ('${COLUMNS}' + length($0))/2, $0); }' | head -n -1
}
magento_trace_format_2() {
    awk '{tabs=""; for (counter = NR; counter > 0; counter--){ tabs=tabs"  "}; print tabs$0}' | sed 's/#[0-9]*//'
}
my_ip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}

curl_domain_to_ip() {
    curl --connect-to www.persen.de:443:194.6.194.235:443 https://www.persen.de/
}
yml_remove-ports() { yq 'del(.services | .[] | .ports)' }

mage_clean_composer() { rm -rf vendor/composer vendor/magento/framework* vendor/magento/magento-composer-installer vendor/magento/composer vendor/composer vendor/magento/composer-dependency-version-audit-plugin}
mage_create_admin() {bin/m admin:user:create --admin-user=admin --admin-password=Admin123 --admin-email=test@admin.com --admin-firstname=Admin --admin-lastname=Bob}

rep-eat () {
    reps=$1
    shift
    for i in {1..$reps}
    do
	echo "$*" | bash
    done
}
repeat_100() { for i in {1..100}; do "$@"; done }
repeat_char() { for i in {1..$1}; do echo "$2"; done }
center() { awk '{ printf("%*s\n", ('${COLUMNS}' + length($0))/2, $0); }' }
find_sorted_by_time () {
    find . -type f -printf "\n%AD %AT %p" | sort -t' ' -k1.7,1.8n -k1.1,1.2n -k1.4,1.5n -k2.1,2.2n -k2.4,2.5n -k2.7,2.8n -k2.10,2.19n
}

sqlresult2json() {
    grep -v '^+' | \
	awk 'BEGIN { FS="|"; OFS=","}{$1=$1}1' | \
	sed -E 's/\s+//g' | sed 's/^,//;s/,$//' | \
	csv2json
    }

    random-string() {
	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
    }

    filter_php_files () {
	grep -E '(\w*/\w*)+\.php' "$@"
    }
    clipc () {
	local content=$(sponge)
	echo -n "$content" | clipcopy || return 1
	local short="$(echo $content | trim)"
	echo ${(%):-"%B$short%b copied to clipboard."}
    }
    alias cpc='clipc'

### GIT
git_remove_origin() { sed -E 's/origin.*,[[:space:]]//' }
git_remove_branches_from_log () {sed -E 's/\([a-zA-Z_\ /,->]*\)//'}
branches-clean() {
    git branch --merged | grep -v `git branch --show-current` | while read branch; do git branch -d $branch; done
}
### GIT

sqlresult2csv () {
    grep -v '^\+' | awk 'BEGIN { FS="|"; OFS=","}{$1=$1}1' | awk '{$1=$1};1' | sed -E 's/\s+/ /g' | sed -E 's/^,//;s/,$//g' | sed -E 's/,$//g'
}

showfilesandpaths() { echo "$@"; display "$@" }

find_by_time () {
    find . -type f -printf "
    %AD %AT %p" | sort -t' ' -k1.7,1.8n -k1.1,1.2n -k1.4,1.5n -k2.1,2.2n -k2.4,2.5n -k2.7,2.8n -k2.10,2.19n
}

replace_each_char() { sed 's/./"\0"\n,/g' }

### CSV
csvlook_alt () {
    /usr/bin/csvlook "$@" | sed 's/- | -/──┼──/g;s/| -/├──/g;s/- |/──┤/;s/|/│/g;2s/-/─/g'
}

composer_fd_pkg_lock() {
    PACKAGE="$1"
    jq --arg PACKAGE "$PACKAGE" '.packages[] | select(.name == $PACKAGE) | {version, name, dist, source, time}'
}

### DOCKER ###
dock_image_by_size() { docker image ls | awk 'NR!=1 {print $7" "$0}' | sort -n}
### DOCKER ###

## VARIABLES ##
export SQL_DATE_FILE_FORMAT="%d_%m_%Y"
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
export GIT_LOG_ONELINE='%C(always,yellow)%h%C(always,reset) %C(always,green)(%ar)%C(always,reset) %C(always,reset)%s'
export DEV_DIR="$HOME/dev/"
## VARIABLES ##

### PERSONAL ###
find_ip () {
    me=$(whoami)
    filter="wlp"

    if [[ "$me" == 'vlado' ]]; then filter='enp'; fi

    ip neigh | grep --color=auto -E "$filter" | grep --color=auto -E -v FAIL | grep --color=auto -E -v '^192\.168\.1\.1 ' | cut -d " " -f1
}
calibre_update() {
    sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
}
subtitle_name_update () {
    subtitle=$(fd srt | head -1)
    video_file=$(fd mp4 | head -1)
    mv $subtitle ${video_file%.*}.${subtitle##*.}
}

# fuzzy cd see https://github.com/NicolaiRuckel/dotfiles/blob/main/zshrc
function fcd() {
    while true; do
	local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
	local dir="$(printf '%s\n' "${lsd[@]}" |
	    fzf --reverse --preview '
		    __cd_nxt="$(echo {})";
		    __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
		    echo $__cd_path;
		    echo;
		    ls -p --color=always "${__cd_path}";
		    ')"
		    [[ ${#dir} != 0 ]] || return 0
		    builtin cd "$dir" &> /dev/null
		done
	    }

### PERSONAL ###
# https://github.com/Phantas0s/.dotfiles/blob/master/zsh/scripts.zsh
matrix () {
    local lines=$(tput lines)
    cols=$(tput cols)

    awkscript='
    {
	letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"
	lines=$1
	random_col=$3
	c=$4
	letter=substr(letters,c,1)
	cols[random_col]=0;
	for (col in cols) {
	    line=cols[col];
	    cols[col]=cols[col]+1;
	    printf "\033[%s;%sH\033[2;32m%s", line, col, letter;
	    printf "\033[%s;%sH\033[1;37m%s\033[0;0H", cols[col], col, letter;
	    if (cols[col] >= lines) {
		cols[col]=0;
	    }
	}
    }
    '

    echo -e "\e[1;40m"
    clear

    while :; do
	echo $lines $cols $(( $RANDOM % $cols)) $(( $RANDOM % 72 ))
	sleep 0.05
    done | awk "$awkscript"
}
diff_in_days () {
    datum1=`date -d "$1" "+%s"`
    datum2=`date -d "$2" "+%s"`
    diff=$(($datum2-$datum1))
    days=$(($diff/(60*60*24)))
    echo $days
}

urlencode () {
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C
    local i=1
    local length="${#1}"
    while [ $i -le $length ]
    do
	local c=$(echo "$(expr substr $1 $i 1)")
	case $c in
	    ([a-zA-Z0-9.~_-]) printf "$c" ;;
	    (' ') printf "%%20" ;;
	    (*) printf '%%%02X' "'$c" ;;
	esac
	i=`expr $i + 1`
    done
    LC_COLLATE=$old_lc_collate
}
sql_values() { sql2csv | trim_both , | tail -n +2 | remove_empty_lines }
alias z='zsh'
alias vim='nvim'

### ZSH
# put the cursor in a subshell $()
# using Ctrl-j
function _zle_subshell {
    RBUFFER='$()'"$RBUFFER"
    ((CURSOR=CURSOR+2))
}
zle -N _zle_subshell
bindkey '^J' _zle_subshell
