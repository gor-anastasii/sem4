const isFetching: boolean = true
const isLoading: boolean = false

const int: number = 42
const float: number = 4.2
const num: number = 3e10

const mess: string = "Hello Typescript"

const numberArr: number[] = [1, 1, 2, 3, 5, 8, 13]
const numberArr2: Array<number> = [1, 1, 2, 3, 5, 8, 13]

const words: string[] = ["Hello", "Typescript"]

//Tuple
const contact: [string, number] = ['Nastya', 1234567]

//Any
let variable: any = 54
variable = 'str'
variable = []

function sayMyName(name: string): void{
    console.log(name)
}
sayMyName('Nastya')

//Never
function throwNever(mess: string): never{
    throw new Error(mess)
}

function infinite(): never{
    while (true){

    }
}

//Type
type Login = string
const login: Login = 'admin'

type ID = string | number
const id1: ID = 1234
const id2: ID = '2345'

type SomeType = string | null | undefined