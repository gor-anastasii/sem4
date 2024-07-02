const arrOfNums: Array<number> = [1, 1, 2, 3, 5]
const arrOfStrs: Array<string> = ["Hello", "Typescript"]

function reverse<T>(arr: T[]): T[]{
    return arr.reverse()
}

reverse(arrOfNums)
reverse(arrOfStrs)


function concat<G>(a: G | G[], b: G | G[]): G | G[]{
    if(typeof a === 'string' && typeof b === 'string'){
        return (a + b) as G
    }
    return (a as G[]).concat(b as G[]) 
}

console.log(concat<string>(['sdfg', '34'], ['iurehwg']))
console.log(concat<string>('Henvir', 'fvgbhnjk'))
console.log(concat<string>([1, 2], [3, 4]))