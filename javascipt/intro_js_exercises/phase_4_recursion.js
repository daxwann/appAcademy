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
