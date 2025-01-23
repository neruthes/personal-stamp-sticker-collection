#!/bin/bash

function make_final_stamp() {
    proj_id="$1"
    [[ "$is_landscape" == y ]] && rotate=y
    output_png="src/$proj_id/frame/$proj_id.out_rz.png"
    rotate="$rotate" bash utils/rouzao-30x40.sh  "src/$proj_id/frame/$proj_id.30x40.png"
    magick composite misc/deco-star1-gold.png misc/rouzao-30x40.png "$output_png"
    magick "$output_png" -crop 2400x3200+100+100 "$output_png"
    magick convert -verbose "$output_png" misc/punchmask-30x40.png -compose CopyOpacity -composite "$output_png"
}




case $1 in
    src/*/)
        proj_id="$(basename "$1")"
        jspath="$1/$(basename "$1").js"
        source "src/$proj_id/config.sh"
        texpath="$1/frame/$(basename "$1" | cut -d. -f1).frame.tex"
        if [[ -e "$jspath" ]]; then
            node "$jspath" > "$jspath.svg"
            rsvg-convert "$jspath.svg" -z2 -o "$jspath.png"
            bash "$1/frame.sh"
        fi
        make_final_stamp "$proj_id"
        # [[ -e "$texpath" ]] && command -v ntex && ntex "$texpath"
        rsync -av src/ _dist/src/
        rsync -av misc/ _dist/misc/
        ;;
esac

