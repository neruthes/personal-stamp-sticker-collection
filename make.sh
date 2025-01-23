#!/bin/bash


case $1 in
    src/*/)
        jspath="$1/$(basename "$1").js"
        texpath="$1/frame/$(basename "$1" | cut -d. -f1).frame.tex"
        if [[ -e "$jspath" ]]; then
            node "$jspath" > "$jspath.svg"
            rsvg-convert "$jspath.svg" -z2 -o "$jspath.png"
            bash "$1/frame.sh"
        fi
        [[ -e "$texpath" ]] && command -v ntex && ntex "$texpath"
        ;;
esac
