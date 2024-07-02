// task 1 
function createPhoneNumber(a: number[]) : string{
    if (a.length !== 10) {
      return 'Error'
    }
    const firstPart = a.slice(0, 3).join("")
    const secondPart = a.slice(3, 6).join("")
    const thirdPart = a.slice(6).join("")
  
    return `(${firstPart}) ${secondPart}-${thirdPart}`
}

console.log(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4, 6]))

// task 2

class Challenge {
  static solution(n: number) {
    if (n < 0) {
      return 0;
    }
  
    let sum = 0;
    for (let i = 3; i < n; i++) {
      if (i % 3 === 0 || i % 5 === 0) {
        sum += i;
      }
    }
  
    return sum;
  }
}

console.log(Challenge.solution(40));

// task 3

function rotateArray(nums: number[], k: number) : number[]{
    const r = k % nums.length
    if (r === 0) {
      return nums
    }
  
    const rotatedArray = [...nums];
    for (let i = 0; i < nums.length; i++) {
      const newIndex = (i + r) % nums.length
      rotatedArray[newIndex] = nums[i]
    }
  
    return rotatedArray
}
  
const nums = [1, 2, 3, 4, 5, 6, 7]
const k = 5
console.log(rotateArray(nums, k))

// task 4 

function findMedian(nums1: number[], nums2: number[]): number {
    const arr2 = [...nums1, ...nums2].sort((a, b) => a - b)
    const index = Math.floor(arr2.length / 2)
  
    if (arr2.length % 2 === 0) {
      return (arr2[index - 1] + arr2[index]) / 2
    } else {
      return arr2[index]
    }
}
  
const nums1 = [1, 3]
const nums2 = [2]
console.log(findMedian(nums1, nums2))
  
const nums3 = [1, 2]
const nums4 = [3, 5]
console.log(findMedian(nums3, nums4))