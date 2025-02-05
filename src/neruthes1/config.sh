IM_ANCHOR=SouthWest
is_landscape=y
rz_hover_path=src/neruthes1/extra/surface-silver.png



### When executing this hook, PWD is ./src/proj_id
function _hook_preframing() {
    rsvg-convert ./extra/surface.svg -o ./extra/surface.png
    rsvg-convert <(sed 's|black|#FFEE99|g' ./extra/surface.svg) -o ./extra/surface-gold.png
    rsvg-convert <(sed 's|black|#DDDDDD|g' ./extra/surface.svg) -o ./extra/surface-silver.png
    for pngname in surface surface-gold surface-silver; do
        magick ./extra/$pngname.png -bordercolor transparent -border 100 -resize x3400 -gravity center -crop 2600x3400+0+0 +repage ./extra/$pngname.png
    done
    rsvg-convert ./extra/avatar.svg --width 1650 -o ./extra/avatar.png
    magick composite ./extra/avatar.png ./neruthes1.js.png ./neruthes1.js.png
}


function _preparation_notes() {
    # Run only once when preparing files into repo. Do not execute in cooking.
    printf ''
}
