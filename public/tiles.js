function reveal(elmnt, color) {
    elmnt.style.backgroundColor = color
};

function over(elmnt, id) {
    elmnt.style.fontSize = 'large';
    id.setAttribute(
            "style", "font-style: italic", "font-size: small");
};

function not_over(elmnt, id) {
    elmnt.style.fontSize = 'small';
    id.style.display = 'none';
};
