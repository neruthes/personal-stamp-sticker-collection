#!/bin/bash

ws_dir="$1"
[[ -d "$1" ]] || exit 1


project_id="$(basename "$ws_dir")"
small_png="$ws_dir"/frame/"$project_id".rz5533-item_small.jpg
out_png="$ws_dir"/frame/"$project_id".rz5533.png

magick -size 862x2161 xc:transparent "$out_png"
magick "$ws_dir"/frame/"$project_id".rz5533-item.png -rotate 90 -resize 190x "$small_png"

for count_xx in {0..2}; do
    for count_yy in {0..5}; do
        posX=$((count_xx * 270 + 60))
        posY=$((count_yy * 350 + 60))
        magick composite -geometry +$posX+$posY "$small_png" "$out_png" "$out_png"
    done
done
