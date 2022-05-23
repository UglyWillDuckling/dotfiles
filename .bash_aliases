
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

filter_out_empty() { awk 'NF'; }
filtersortconfig() { awk -f config_dump.awk config_dump_prod.txt 2>/dev/null | sort;}
uniq_difference_config() { diff --color dump_config_staging.txt dump_config_prod.txt | egrep "^>|^<" | awk '{print $2}' | egrep -e ".*/.*/" |sort -u; }
mutagen_restart() { mutagen daemon stop; mutagen daemon start; }
log_find_order_state_change() { find . -name '*.gz' -mtime -200 | grep system | sort | xargs zcat  | grep -e "State Handler" | grep closed | awk '{print $17}' | sed 's/^/"/' | sed 's/$/",/'; }
log_find_call_on_null () { cat system.log | grep -e "getValue() on null" -A 2 | grep getCalculator | sort -u | awk -F\' '{print $2","}'; }
log_find_call_on_null_allsystem () { find . -name "system.log*.gz" -printf "%T+\t%p\n" | sort | awk '{print $2}' | xargs grep -e "getValue() on null"; }
file_open() { fd --type f $2 $1 |  rofi -keep-right -dmenu -i -p Docs | read file; xdg-open $file 2>/dev/null; }
emojis() {
    bat ~/.oh-my-zsh/plugins/emoji/emoji-char-definitions.zsh | tail +25 | awk 'BEGIN{ FS="=" } {print $2}' | head -n 200 | xargs | sed "s/\\$/\$\'/g" | sed "s/\s/' /g" | sed "s/$/\'/"
}

alias msl='bin/mutagen-sync_list'
alias open='xdg-open >/dev/null 2>/dev/null'
alias grep='grep --color=always'
alias diff='diff --color'
alias j='jobs'
alias upgrade='sudo apt-get update; sudo apt-get upgrade; flatpak update; snap refresh;'
alias arch_pgrade='sudo pacman -Syu'
alias linux_version='uname -srm'
alias vpn_reconnect='sudo ipsec down monsoon && sudo ipsec up monsoon'
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
prepend_to() { <<(echo "$1") < $2 | sponge |cat }
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

