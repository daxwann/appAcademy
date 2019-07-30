// Write a curriedSum function that takes an integer 
// (how many numbers to sum) and returns a function 
// that can be successively called with single arguments 
// until it finally returns a sum. 

function curriedSum(numArgs) {
  let totalArgs = numArgs;
  let argCount = 0;
  let sum = 0;

  return function addNum(num) {
    argCount++;

    // return function to add next number to sum
    if (argCount < totalArgs) {
      sum += num;
      return addNum;
    } 
    
    // return sum
    if (argCount === totalArgs) {
      sum += num;
    }

    return sum;
  }
}

// test
const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56