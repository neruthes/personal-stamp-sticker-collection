cd src/semesse1 || exit 1
mkdir -p frame

magick semesse1.js.png -crop 2909x2000+0+0 -bordercolor white -border 364 frame/semesse1.15x20.png
magick semesse1.js.png -crop 2667x2000+0+0 -bordercolor white -border 333 frame/semesse1.20x30.png
magick semesse1.js.png -crop 3000x2000+0+0 -bordercolor white -border 250 frame/semesse1.25x35.png
magick semesse1.js.png -crop 2800x2000+0+0 -bordercolor white -border 200 frame/semesse1.30x40.png

