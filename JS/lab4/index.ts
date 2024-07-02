type Product = {
    id: number,
    size: number,
    color: string,
    price: number,
    type: string,
}

type Boots = Product & {
    type: 'boots'
}

type Sneakers = Product & {
    type: 'sneakers'
}

type Sandals = Product & {
    type: 'sandals'
}

type Footwear = {
    boots: Boots[],
    sneakers: Sneakers[],
    sandals: Sandals[],
    [key: string]: Product[],
}

type Products = {
    footwear: Footwear
}

const products : Products = {
    footwear: {
        boots: [
            { id: 1, size: 39, color: 'black', price: 1800, type: 'boots' },
            { id: 2, size: 36, color: 'white', price: 3800, type: 'boots' },
            { id: 3, size: 40, color: 'blue', price: 2300, type: 'boots' }
        ],
        sneakers: [
            { id: 4, size: 42, color: 'pink', price: 2800, type: 'sneakers' },
            { id: 5, size: 37, color: 'white', price: 3100, type: 'sneakers' },
            { id: 6, size: 38, color: 'black', price: 1300, type: 'sneakers' }
        ],
        sandals: [
            { id: 7, size: 41, color: 'white', price: 1100, type: 'sandals' },
            { id: 8, size: 39, color: 'black', price: 2300, type: 'sandals' },
            { id: 9, size: 40, color: 'pink', price: 1800, type: 'sandals' },
            { id: 10, size: 37, color: 'white', price: 1500, type: 'sandals' }
        ],
    }
}


function* productsIterator(footwear: Footwear){
    const categories = Object.keys(footwear)

    for (const category of categories) {
        const products = footwear[category]
        yield* products
    }
}

const iterator = productsIterator(products.footwear)

for (const product of iterator) {
    console.log(product)
}
console.log('\n')



function filterFootwear(products: Products, minPrice: number, maxPrice: number, size: number, color: string): Product[] {
    const filteredProduct: Product[] = []

    for (const categoryKey in products.footwear) {
        if (products.footwear.hasOwnProperty(categoryKey)) {
            const category = products.footwear[categoryKey]
            for (const product of category) {
                if (product.price >= minPrice && product.price <= maxPrice && product.size === size && product.color === color) {
                    filteredProduct.push(product)
                }
            }
        }
    }

    return filteredProduct
}

const filter = filterFootwear(products, 1000, 2000, 39, 'black');
console.log(filter,'\n') 



function addProduct(products: Products, product: Product): void {
    const categoryKey = product.type
    if (products.footwear.hasOwnProperty(categoryKey)) {
        products.footwear[categoryKey].push(product)
    }
}

addProduct(products, { id: 11, size: 38, color: 'blue', price: 2000, type: 'sneakers' })

const iterator2 = productsIterator(products.footwear)
for (const product of iterator2) {
    console.log(product)
}
console.log('\n')


class FootwearPare{
    id: number
    size: number
    color: string
    discount: number
    cost: number
    finalPrice: number

    constructor(id: number, size: number, color: string, cost: number, discount: number){
        this.id = id
        this.size = size
        this.color = color
        this.discount = discount
        this.cost = cost
        this.finalPrice = this.cost * (1 - this.discount / 100)
    }

    get price():number{
        return this.cost * (1 - this.discount / 100)
    }

    set price(newPrice: number){
        this.cost = newPrice;
    }
}

type NewProducts = {
    footwear: {
        Boots: FootwearPare[];
        Sneakers: FootwearPare[];
        Sandals: FootwearPare[];
    };
};

let allProduct: NewProducts={
    footwear:{
        Boots:[
            new FootwearPare(11, 35, 'red', 34, 10),
            new FootwearPare(12, 37, 'blue', 35, 15),
            new FootwearPare(13, 38, 'red', 65, 14),
            new FootwearPare(14, 39, 'green', 24, 10),
            new FootwearPare(15, 40, 'white', 56, 11),
        ],
        Sneakers:[
            new FootwearPare(21, 32, 'black', 12, 20),
            new FootwearPare(22, 33, 'yellow', 14, 100),
            new FootwearPare(23, 34, 'orange', 21, 25),
            new FootwearPare(24, 35, 'red', 24, 75),
            new FootwearPare(25, 36, 'white', 34, 35),
        ],
        Sandals:[
            new FootwearPare(31, 35, 'red', 56, 2),
            new FootwearPare(32, 34, 'blue', 76, 3),
            new FootwearPare(33, 34, 'grey', 87, 4),
            new FootwearPare(34, 45, 'white', 45, 2),
            new FootwearPare(35, 41, 'white', 67, 5),
        ]
    }
}
