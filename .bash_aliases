
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

branches-clean() {
  git branch --merged | grep -v `git branch --show-current` | while read branch; do git branch -d $branch; done
}

filter_empty() { awk 'NF'; }
remove_empty_lines() { filter_empty }
filtersortconfig() { awk -f config_dump.awk config_dump_prod.txt 2>/dev/null | sort;}
uniq_difference_config() { diff --color dump_config_staging.txt dump_config_prod.txt | egrep "^>|^<" | awk '{print $2}' | egrep -e ".*/.*/" |sort -u; }
mutagen_restart() { mutagen daemon stop; mutagen daemon start; }
log_find_order_state_change() { find . -name '*.gz' -mtime -200 | grep system | sort | xargs zcat  | grep -e "State Handler" | grep closed | awk '{print $17}' | sed 's/^/"/' | sed 's/$/",/'; }
log_find_call_on_null () { cat system.log | grep -e "getValue() on null" -A 2 | grep getCalculator | sort -u | awk -F\' '{print $2","}'; }
log_find_call_on_null_allsystem () { find . -name "system.log*.gz" -printf "%T+\t%p\n" | sort | awk '{print $2}' | xargs grep -e "getValue() on null"; }
file_open() { fd --type f $2 $1 |  rofi -keep-right -dmenu -i -p Docs | read file; xdg-open $file 2>/dev/null; }
emojis() {
    echo $(bat ~/.oh-my-zsh/plugins/emoji/emoji-char-definitions.zsh | tail +25 | awk 'BEGIN{ FS="=" } {print $2}' | head -n 200 | xargs | sed "s/\\$/\$\'/g" | sed "s/\s/' /g" | sed "s/$/\'/" | sed -E "s/\\$|'//g")
}

alias reload='_omz::reload'
alias b="bat"
alias ll="ls --color -lhF --group-directories-first"
alias l="ls --color -lAhF --group-directories-first"
alias msl='bin/mutagen-sync_list'
alias tolower="awk '{print tolower($0)}'"
alias open='xdg-open >/dev/null 2>/dev/null'
alias grep='grep --color=auto'
alias diff='diff --color'
alias j='jobs'
alias upgrade='sudo apt-get update; sudo apt-get upgrade; sudo flatpak update; sudo snap refresh;'
alias arch_pgrade='sudo pacman -Syu'
alias linux_version='uname -srm'
alias xdebug_staging='php -c /etc/platform/uut3dca33gxuq_stg/php.xdebug.ini -d xdebug.profiler_enable=On  bin/magento'
alias h='highlight'
alias remove_color_codes='sed -r "s/\x1B\[(([0-9]{1,2})?(;)?([0-9]{1,2})?)?[m,K,H,f,J]//g"'
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
trim_whitespace_start() { sed -e 's/^[[:space:]]//' }

magento_trace_format() {
    sed 's/^#[0-9]* //' | grep -v "closure\|___callParent\|___callPlugins" | awk '{print $0 "\n|"}' | awk '{ printf("%*s\n", ('${COLUMNS}' + length($0))/2, $0); }' | head -n -1
}
magento_trace_format_2() {
    awk '{tabs=""; for (counter = NR; counter > 0; counter--){ tabs=tabs"  "}; print tabs$0}' | sed 's/#[0-9]*//'
}
my_ip() {
    curl -s https://icanhazip.com
}

curl_domain_to_ip() {
    curl --connect-to www.persen.de:443:194.6.194.235:443 https://www.persen.de/
}
yml_remove-ports() { yq 'del(.services | .[] | .ports)' }

mage_clean_composer() { rm -rf vendor/magento/framework* vendor/magento/magento-composer-installer vendor/magento/composer vendor/composer }
mage_create_admin() {bin/m admin:user:create --admin-user=admin --admin-password=Admin123 --admin-email=test@admin.com --admin-firstname=Admin --admin-lastname=Bob}

repeat_100() { for i in {1..100}; do "$@"; done }
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
        echo ${(%):-"%B$content%b copied to clipboard."}
}
alias cpc='clipc'

git_remove_origin() { sed -E 's/origin.*,[[:space:]]//' }
git_remove_branches_from_log () {sed -E 's/\([a-zA-Z_\ /,->]*\)//'}
sqlresult2csv () {
	grep -v '^+' | awk 'BEGIN { FS="|"; OFS=","}{$1=$1}1' | sed -E 's/\s+//g' | sed 's/^,//;s/,$//'
}

showfilesandpaths() { echo "$@"; display "$@" }
