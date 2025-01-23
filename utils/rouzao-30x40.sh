#!/bin/bash

input_png="$1"
output_png=.tmp/rouzao-30x40.png

if [[ "$rotate" == y ]]; then
    EXTRA_ARGS=" $EXTRA_ARGS -rotate 90 "
fi

magick "$input_png" $EXTRA_ARGS -bordercolor white -border 100 "$output_png"
realpath "$output_png"
