/* range(start, end) - receives a start and end value, returns an array from start up to end */

function range(start, end) {
  let arr = [];
  
  if (start > end)
    return null;
  else 
    arr.push(start);
  
  if (start != end)
    arr = arr.concat(range(start + 1, end));

  return arr; 
};
