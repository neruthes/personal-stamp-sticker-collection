IM_ANCHOR=SouthWest
is_landscape=y
rz_hover_path=src/neruthes1/extra/surface-silver.png



### When executing this hook, PWD is ./src/proj_id
function _hook_preframing() {
    rsvg-convert ./extra/surface.svg -o ./extra/surface.png; realpath ./extra/surface.png
    rsvg-convert <(sed 's|black|#F1D877|g' ./extra/surface.svg) -o ./extra/surface-gold.png
    rsvg-convert <(sed 's|black|#DDDDDD|g' ./extra/surface.svg) -o ./extra/surface-silver.png
    rsvg-convert ./extra/avatar.svg --width 1650 -o ./extra/avatar.png
    magick composite ./extra/avatar.png ./neruthes1.js.png ./neruthes1.js.png
}


function _preparation_notes() {
    # Run only once when preparing files into repo. Do not execute in cooking.
    printf ''
}
