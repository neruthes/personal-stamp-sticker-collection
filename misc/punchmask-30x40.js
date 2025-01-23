// This script generates a mask for previewing punch holes

const fs = require('fs');

const canvas_width = 2400;
const canvas_height = 3200;
const row_total = 10;
const column_total = 8;

let SVG_MASK_INNER = '';
for (let row = 0; row <= 10; row++) {
    for (let column = 0; column <= 8; column++) {
        if ((
            row === 0 ||
            row === row_total
        ) || (
            column === 0 ||
            column === column_total
        )) {
            SVG_MASK_INNER += `<circle fill="black"
                r="90"
                cx="${canvas_width * column / column_total}"
                cy="${canvas_height * row / row_total}"
            />`
        }
    }
}




let OUTPUT_TEMPLATE = `<svg viewBox="0 0 2400 3200" fill="none" xmlns="http://www.w3.org/2000/svg">

<defs>
    <mask id="mask_holes">
        <rect x="-100" y="-100" width="4000" height="4000" fill="white" />
        ${SVG_MASK_INNER}
    </mask>
</defs>

<rect x="-100" y="-100" width="4000" height="4000" fill="gray" mask="url(#mask_holes)" />

</svg>
`;

// console.log(OUTPUT_TEMPLATE)
fs.writeFileSync('misc/punchmask-30x40.svg', OUTPUT_TEMPLATE);


// node misc/punchmask-30x40.js; rsvg-convert misc/punchmask-30x40.svg -o misc/punchmask-30x40.png
