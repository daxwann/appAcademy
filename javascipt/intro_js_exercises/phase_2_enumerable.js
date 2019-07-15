/* Array#myEach(callback) - receives a callback function and executes the callback for each element in the array */

Array.prototype.myEach = function(callback) {
  let self = this;

  for (let i = 0; i < self.length; i++) {
    callback(self[i]);
  }

  return undefined;
};

/*Array#myMap(callback) - receives a callback function, returns a new array of the results of calling the callback function on each element of the array*/

Array.prototype.myMap = function(callback) {
  let self = this;
  let newArr = [];

  self.myEach((ele) => {
    newArr.push(callback(ele));
  });

  return newArr;
};

/* Array#myReduce(callback[, initialValue]) - (like Ruby's Array#inject) receives a callback function, and optional initial value, returns an accumulator by applying the callback function to each element and the result of the last invocation of the callback (or initial value if supplied) */

Array.prototype.myReduce = function(callback, initial) {
  let self = this;

  if (initial === undefined) {
    initial = self[0];
    self = self.slice(1);
  }

  let accumulator = initial;

  self.myEach((ele) => {
    accumulator = callback(accumulator, ele); 
  });

  return accumulator;
};
