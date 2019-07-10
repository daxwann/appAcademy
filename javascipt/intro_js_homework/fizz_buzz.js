/*Define a function fizzBuzz(array) that takes an array and returns a new array of every number in the array that is divisible by either 3 or 5, but not both.*/

const fizzBuzz = (array) => {
  const arr = array.filter(num => num % 3 == 0 || num % 5 == 0);
  return arr;
};

console.log(fizzBuzz([1, 3, 5, 6, 7, 111])); // [3, 5, 6, 111]
console.log(fizzBuzz([15, 25, 12, -12, 2])); // [15, 25, 12, -12]
