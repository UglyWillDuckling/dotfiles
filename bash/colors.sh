#!/usr/bin/env bash

# set -v

# $1 is the color number
# $* represents the text that we want to output
color() {
    c=$1
    shift
    t="$*"
    echo -e "\e[38;5;${c}m${t}\e[0m"
}

bold() {
    echo -e "\e[1m$*\e[0m"
}

# by type
error() { red "$*"; }
success() { green "$*"; }
warning() { yellow 3 "$*"; }

# by color
red() { color 1 "$*"; }
green() { color 2 "$*"; }
yellow() { color 3 "$*"; }
blue() { color 4 "$*"; }

hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    #        hex_to_rgb "000000"
    : "${1/\#/}"
    ((r = 16#${_:0:2}, g = 16#${_:2:2}, b = 16#${_:4:2}))
    printf '%s\n' "$r $g $b"
}

rgb_to_hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
