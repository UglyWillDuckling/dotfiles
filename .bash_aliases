
dk-debug-shell-php()
{
    if [ -z "$1" ]
    then
        echo "You must pass say what is the script to run";
        exit 0;
    fi
 
    echo "This will start the debug for the file $1"
    docker-compose exec php sh -c "php -dxdebug.profiler_enable=1 -dxdebug.remote_autostart=1 $1"
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

alias msl='bin/mutagen-sync_list'
alias grep='grep --color=always'
alias diff='diff --color'
alias j='jobs'
alias upgrade='sudo apt-get update; sudo apt-get upgrade'
alias linux_version='uname -srm'
alias vpn_reconnect='sudo ipsec down monsoon && sudo ipsec up monsoon'

