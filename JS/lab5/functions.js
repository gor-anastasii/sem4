function add(a, b) {
    return a + b;
}
function toUpperCase(str) {
    return str.trim().toUpperCase();
}
function position(a, b) {
    if (!a && !b) {
        return { x: undefined, y: undefined };
    }
    if (a && !b) {
        var result = { x: a, y: undefined, default: a.toString() };
        return result;
    }
    return { x: a, y: b };
}
console.log('Empty: ', position());
console.log('One param: ', position(42));
console.log('Two params: ', position(22, 8));
