/* range(start, end) - receives a start and end value, returns an array from start up to end */

const range = function(start, end) {
  let arr = [];
  
  if (start > end)
    return null;
  else 
    arr.push(start);
  
  if (start != end)
    arr = arr.concat(range(start + 1, end));

  return arr; 
};

/* sumRec(arr) - receives an array of numbers and recursively sums them */

const sumRec = function(arr) {
  if (arr.length == 0)
    return 0;

  if (arr.length == 1)
    return arr[0];
    
  if (arr.length > 1)
    return arr[0] + sumRec(arr.slice(1));
};

/* exponent(base, exp) - receives a base and exponent, returns the base raise to the power of the exponent (base ^ exp) */

/* recursion 1 */
const exp1 = function(base, exp) {
  if (exp == 0)
    return 1;

  return base * exp1(base, exp - 1);
};

/* recursion 2 */
const exp2 = function(base, exp) {
  if (exp == 0)
    return 1;
  
  if (exp == 1)
    return base;

  if (exp % 2 == 0)
    return exp2(base, exp / 2) ** 2;
  else
    return base * (exp2(base, (exp - 1) / 2) ** 2);
};

/* fibonacci(n) - receives an integer, n, and returns the first n Fibonacci numbers */

const fibonacci = function(n) {
  if (n == 0)
    return [];
  else if (n == 1)
    return [0];
  else if (n == 2)
    return [0, 1]
  else { 
    arr = fibonacci(n - 1);
    return arr.concat(arr[n - 2] + arr[n - 3]);
  }
};
 
/* deepDup(arr) - deep dup of an Array */

const deepDup = function(arr) {
  let dupped = [];
  
  arr.forEach((ele) => {
    if (ele instanceof Array)
      dupped.push(deepDup(ele));
    else
      dupped.push(ele);
  });

  return dupped;
};

/* bsearch(arr, target) - receives a sorted array, returns the index of the target or -1 if not found */

const bsearch = function(arr, target) {
  let count = arr.length;
  let probeIdx = Math.floor(count / 2);
  let probe = arr[probeIdx];

  if (count === 0)
    return -1;

  if (target === probe)
    return probeIdx;
  else if (target < probe) {
    return bsearch(arr.slice(0, probeIdx), target); 
  } else {
    let rightResult = bsearch(arr.slice(probeIdx + 1), target); 
    return rightResult === -1 ? -1 : probeIdx + 1 + rightResult;
  } 
};

/* mergesort(arr) - receives an array, returns a sorted copy of the array by implementing merge sort sorting algorithm */

const merge = function(left, right) {
  let merged = [];
  
  while (left.length != 0 && right.length != 0) {
    if (left[0] < right[0])
      merged.push(left.shift());
    else if (left[0] == right[0]) {
      merged.push(left.shift());
      merged.push(right.shift());
    } else {
      merged.push(right.shift());
    }
  }

  if (left.length != 0) {
    merged = merged.concat(left);
  } else if (right.length != 0) {
    merged = merged.concat(right);
  }

  return merged;
};

const mergeSort = function(arr) {
  let count = arr.length;
  let fulcrum = Math.floor(count / 2);

  if (count == 1)
    return arr;

  let left = mergeSort(arr.slice(0, fulcrum));
  let right = mergeSort(arr.slice(fulcrum));

  return merge(left, right);
};

/* subsets(arr) - receives an array, returns an array containing all the subsets of the original array */

const subsetsUtil = function(arr) {
  if (arr.length == 0)
    return [[]];

  let last = arr.pop();
  let beforeLastSubsets = subsetsUtil(arr);
  let newSubsets = beforeLastSubsets.slice(0);

  beforeLastSubsets.forEach((subset) => {
    let subsetCopy = subset.slice(0);
    subsetCopy.push(last);
    newSubsets.push(subsetCopy);
  });

  return newSubsets;
};

const subsets = function(arr) {
  let subsetsArr = [];

  if (arr.length == 0)
    return [[]];
  else
    subsetsArr = subsetsUtil(arr);   

  subsetsArr.shift();

  return subsetsArr;
};
