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

/* Array#twoSum - returns an array of position pairs where the elements sum to zero. Time complexity: N^2 */

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

/* Array#twoSum2 with time complexity of N */

Array.prototype.twoSum2 = function() {
  let pairs = []
  let self = this;
  const indexHash = {};

  this.forEach((num, idx) => {
    if (indexHash[num * -1]) {
      const newPairs = indexHash[num * -1].map((pairedIdx) => [pairedIdx, idx]);
      pairs = pairs.concat(newPairs); 
    }

    indexHash[num] ? indexHash[el].push(idx) : indexHash[num] = [idx];
  });

  return pairs;
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
