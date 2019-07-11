/*Array#uniq - returns a new array containing only the unique elements of the original array*/

Array.prototype.uniq = function() {
  let uniqueArray = [];
  let self = this;

  self.forEach((ele) => {
    if (!uniqueArray.includes(ele))
      uniqueArray.push(ele);
  });

  return uniqueArray;
};

/*Array#twoSum - returns an array of position pairs where the elements sum to zero*/

Array.prototype.twoSum = function() {
  let twoSumArr = [];
  let self = this;

  for (let i = 0; i < self.length; i++) {
    for (let j = i + 1; j < self.length; j++) {
      if (self[i] + self[j] === 0)
        twoSumArr.push([i, j]);
    }
  }

  return twoSumArr;
};

/* Array#transpose - where we have a two-dimensional array representing a matrix. returns the transpose */

Array.prototype.transpose = function() {
  let transposedArr = [];
  let self = this;

  self.forEach((arr, outer_i) => {
    arr.forEach((ele, inner_i) => {
      if (outer_i === 0)
        transposedArr.push([ele]);
      else
        transposedArr[inner_i].push(ele);
    });
  });

  return transposedArr;
};
