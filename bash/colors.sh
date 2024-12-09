#!/usr/bin/env bash

R='\033[0;31m'
G='\033[0;32m'
Y='\e[33m'

error() { echo -e "${R}$*\e[0m"; }
success() { echo -e "${G}$*\e[0m"; }
warning() { echo -e "${Y}$*\e[0m"; }
