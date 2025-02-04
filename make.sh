#!/bin/bash

# Initialize 'config.sh' variables
rz_hover_path=misc/deco-star1-gold.png



mkdir -p _dist/
rsync -av src/ _dist/src/
rsync -av misc/ _dist/misc/

case $1 in
    src/*/)
        export proj_id="$(basename "$1")"
        export jspath="$1/$(basename "$1").js"
        source "src/$proj_id/config.sh"
        texpath="$1/frame/$(basename "$1" | cut -d. -f1).frame.tex"
        if [[ -e "$jspath" ]]; then
            node "$jspath" > "$jspath.svg"
            rsvg-convert "$jspath.svg" -z2 -o "$jspath.png"
            bash utils/cook.sh
        fi
        # make_final_stamp "$proj_id"
        [[ -e "$texpath" ]] && command -v ntex && ntex "$texpath"
        ;;
esac

