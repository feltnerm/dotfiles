#!/usr/bin/env bash

# function _source_if_file_exists() {
#     local file="$1"
#     ([ -e "$file" ] || [ -f "$file" ]) && . "$file"
# }

# # Check existence of a program
# function _which() {
#     command -v "$1" > /dev/null 2>&1;
# }

# # Are we sudo?
# function _root() {
#     [ "$EUID" = "0" ]
# }

# function _is_osx() {
#     [ "$(uname)" = "Darwin" ]
# }

# function _is_linux() {
#     [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]
# }
