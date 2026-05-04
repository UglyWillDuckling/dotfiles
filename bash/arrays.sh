#!/usr/bin/env bash

# Enabling extdebug allows access to the BASH_ARGV array which stores the current function’s arguments in reverse.
reverse_array() {
    # Usage: reverse_array "array"
    shopt -s extdebug
    f()(printf '%s\n' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}
