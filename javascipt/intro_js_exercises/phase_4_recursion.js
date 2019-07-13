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
