#!/usr/bin/bash

trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}

regex() {
    # Usage: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}
# $ # Trim leading white-space.
# $ regex '    hello' '^\s*(.*)'
# hello

# NOTE: doesn't work
split() {
   # Usage: split "string" "delimiter"
   local IFS=$'\n'

   # s=${s/World/$'\n'}

   read -d "" -rA arr <<< "${1//$2/$'\n'}"
   printf '%s' "${arr}"
}
# $ split "apples,oranges,pears,grapes" ","
# apples
# oranges
# pears
# grapes
#

lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}

# reverse_case() {
#     # Usage: reverse_case "string"
#     printf '%s\n' "${1~~}"
# }

trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}

strip_all() {
    # Usage: strip_all "string" "pattern"
    # printf '%s\n' "${1//$2}"

    echo "${1//$2/}"
}

urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}

urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}

# Check if string starts with sub-string
# 
# if [[ $var == sub_string* ]]; then
#     printf '%s\n' "var starts with sub_string."
# fi
#
# # Inverse (var does not start with sub_string).
# if [[ $var != sub_string* ]]; then
#     printf '%s\n' "var does not start with sub_string."
# fi

