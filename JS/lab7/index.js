//task 2
const myPromise = new Promise((res, rej) => {
    setTimeout(() => {
        res(Math.round(Math.random() * 100))
    }, 3000)
})

myPromise.then(result => console.log("Task 2: ", result))

//task 3

function getDelay(delay){
    return new Promise((res, rej) => {
        setTimeout(() => {
            res(Math.round(Math.random() * 100))
        }, delay)
    })
}

Promise.all([getDelay(1000), getDelay(2000), getDelay(3000)])
       .then(result => console.log("Task 3: ", result))

//task 4

let pr = new Promise((res, rej) => {
    rej('wert')
})

pr.then(() => console.log(1))
  .catch(() => console.log(2))
  .catch(() => console.log(3))
  .then(() => console.log(4))
  .then(() => console.log(5))

  
//task 5

const myPromise2 = new Promise((resolve, reject) => {
    resolve(21)
})
  
myPromise2
    .then(result => {
      console.log(result)
      return result * 2
    })
    .then(result => {
      console.log(result)
    })

//task 6

async function asyncFunc() {
    const result = await Promise.resolve(21)
    console.log(result)
    const newResult = result * 2
    console.log(newResult)
}
  
asyncFunc()

