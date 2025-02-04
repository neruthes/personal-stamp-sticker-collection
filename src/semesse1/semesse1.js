// semesse1.js

// black: 1a1c1d
// white: c7c7c9
// blue: 294e71

let OUTPUT_TEMPLATE = `<svg viewBox="0 0 2000 1000" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="-100" y="-100" width="2200" height="1200" fill="#1a1c1d"  />
    <path d="M -100 1110 l 5 -646 c 805 9 990 -378 2196 -350 l 278 1088 z" fill="#c7c7c9" />
    <path d="M -100 1110 l 33 -465 c 837 53 994 -285 2172 -132 l 173 1030 z" fill="#294e71" />

    <text font-family="TeX Gyre Cursor" font-weight="400" font-size="250" x="1" y="985"
        fill="white" stroke="white" stroke-width="6" transform="scale(0.85,1)">Semesse</text>
</svg>
`;

console.log(OUTPUT_TEMPLATE);
