var arrOfNums = [1, 1, 2, 3, 5];
var arrOfStrs = ["Hello", "Typescript"];
function reverse(arr) {
    return arr.reverse();
}
reverse(arrOfNums);
reverse(arrOfStrs);
function concat(a, b) {
    if (typeof a === 'string' && typeof b === 'string') {
        return (a + b);
    }
    return a.concat(b);
}
console.log(concat(['sdfg', '34'], ['iurehwg']));
console.log(concat('Henvir', 'fvgbhnjk'));
