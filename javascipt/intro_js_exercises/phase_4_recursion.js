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
  let fulcrum = Math.floor(count / 2);

  if (target == arr[fulcrum])
    return fulcrum;
  else if (count == 1)
    return -1;

  left = bsearch(arr.slice(0, fulcrum), target); 
  if (left != -1)
    return left;

  if (count == 2)
    return -1;

  right = bsearch(arr.slice(fulcrum + 1), target); 
  if (right != -1)
    return fulcrum + 1 + right;

  return -1;
};
