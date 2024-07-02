var __spreadArray = (this && this.__spreadArray) || function (to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
        if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
        }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
};
// task 1 
function createPhoneNumber(a) {
    if (a.length !== 10) {
        return 'Error';
    }
    var firstPart = a.slice(0, 3).join("");
    var secondPart = a.slice(3, 6).join("");
    var thirdPart = a.slice(6).join("");
    return "(".concat(firstPart, ") ").concat(secondPart, "-").concat(thirdPart);
}
console.log(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4, 6]));
// task 2
var Challenge = /** @class */ (function () {
    function Challenge() {
    }
    Challenge.solution = function (n) {
        if (n < 0) {
            return 0;
        }
        var sum = 0;
        for (var i = 3; i < n; i++) {
            if (i % 3 === 0 || i % 5 === 0) {
                sum += i;
            }
        }
        return sum;
    };
    return Challenge;
}());
console.log(Challenge.solution(40));
// task 3
function rotateArray(nums, k) {
    var r = k % nums.length;
    if (r === 0) {
        return nums;
    }
    var rotatedArray = __spreadArray([], nums, true);
    for (var i = 0; i < nums.length; i++) {
        var newIndex = (i + r) % nums.length;
        rotatedArray[newIndex] = nums[i];
    }
    return rotatedArray;
}
var nums = [1, 2, 3, 4, 5, 6, 7];
var k = 5;
console.log(rotateArray(nums, k));
// task 4 
function findMedian(nums1, nums2) {
    var arr2 = __spreadArray(__spreadArray([], nums1, true), nums2, true).sort(function (a, b) { return a - b; });
    var index = Math.floor(arr2.length / 2);
    if (arr2.length % 2 === 0) {
        return (arr2[index - 1] + arr2[index]) / 2;
    }
    else {
        return arr2[index];
    }
}
var nums1 = [1, 3];
var nums2 = [2];
console.log(findMedian(nums1, nums2));
var nums3 = [1, 2];
var nums4 = [3, 5];
console.log(findMedian(nums3, nums4));
