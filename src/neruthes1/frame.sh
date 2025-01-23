cd src/neruthes1 || exit 1
mkdir -p frame

magick neruthes1.js.png -crop 2909x2000+0+0 -bordercolor white -border 364 frame/neruthes1.15x20.png
magick neruthes1.js.png -crop 2667x2000+0+0 -bordercolor white -border 333 frame/neruthes1.20x30.png
magick neruthes1.js.png -crop 3000x2000+0+0 -bordercolor white -border 250 frame/neruthes1.25x35.png
magick neruthes1.js.png -crop 2800x2000+0+0 -bordercolor white -border 200 frame/neruthes1.30x40.png

