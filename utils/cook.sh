#!/bin/bash

#
# cook.sh
#
# This script shall cook each subdir with definitions from `recipe.sh`.
# This shall replace old `frame.sh` workflow.
#


# Variables to be defined from `make.sh`:
#   proj_id




# Define hooks
function _hook_preframing() {
    printf ''
}





# Load config now
# shellcheck source=src/semesse1/config.sh
source "src/$proj_id/config.sh"








function make_frames() {
    cd "src/$proj_id" || exit 1
    mkdir -p frame

    [[ "$is_landscape" == y ]] && IM_PARAMS="-rotate 90" # We make sure that the output is always vertical

    _hook_preframing ### When executing this hook, PWD is ./src/proj_id
    magick "$proj_id.js.png" -gravity "$IM_ANCHOR" -crop 2909x2000+0+0 $IM_PARAMS +repage -bordercolor white -border 364 "frame/$proj_id.15x20.png"
    magick "$proj_id.js.png" -gravity "$IM_ANCHOR" -crop 2667x2000+0+0 $IM_PARAMS +repage -bordercolor white -border 333 "frame/$proj_id.20x30.png"
    magick "$proj_id.js.png" -gravity "$IM_ANCHOR" -crop 3000x2000+0+0 $IM_PARAMS +repage -bordercolor white -border 250 "frame/$proj_id.25x35.png"
    magick "$proj_id.js.png" -gravity "$IM_ANCHOR" -crop 2800x2000+0+0 $IM_PARAMS +repage -bordercolor white -border 200 "frame/$proj_id.30x40.png"
    cd ../..
}


function make_final_stamp() {
    output_png="src/$proj_id/frame/$proj_id.out_rz.png"
    magick "src/$proj_id/frame/$proj_id.30x40.png" -bordercolor white -border 100 .tmp/rz_out_tmp.png
    magick composite "$rz_hover_path" .tmp/rz_out_tmp.png "$output_png"
    magick "$output_png" -crop 2400x3200+100+100 "$output_png"
    magick -verbose "$output_png" misc/punchmask-30x40.png -compose CopyOpacity -composite "$output_png"
}



function target_rouzao_30x40() {
    ### Output size: 2600x3400

    input_png="src/$proj_id/frame/$proj_id.30x40.png"
    output_png="src/$proj_id/frame/$proj_id.rouzao_3040.png"

    magick "$input_png" -bordercolor white -border 100 "$output_png"
    realpath "$output_png"
}




make_frames
make_final_stamp
target_rouzao_30x40
