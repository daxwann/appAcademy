// Write a method Function.prototype.curry(numArgs). 
// This should return a function that will:
//  - Collect up arguments until there are numArgs of them,
//  - If there are too few arguments still, it should return itself.
//  - When there are numArgs arguments, it should call the original function.
//  - Write a version that uses Function.prototype.apply 
//    and another one that uses ... (the spread operator).

// using Function.prototype.apply
Function.prototype.curry1 = function(numArgs) {
  let fn = this;
  let args = [];
  let argCount = 0;

  if (argCount === numArgs) {
    return fn.apply(fn.caller, args);
  } 

  return function curry(arg) {
    argCount++;
    args.push(arg);

    if (argCount === numArgs) {
      return fn.apply(fn.caller, args);
    } else {
      return curry;
    }
  }
};

// using `...` spread operator

Function.prototype.curry2 = function(numArgs) {
  let fn = this;
  let argCount = 0;
  let args = [];

  if (numArgs === 0) {
    return fn(...args);
  }

  return function curry(arg) {
    argCount++;
    args.push(arg);

    if (argCount === numArgs) {
      return fn(...args);
    } else {
      return curry;
    }
  };
};

//test

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree(4, 20, 6)); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry2(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
console.log(f1);
f1 = f1(20); // [Function]
console.log(f1);
f1 = f1(6); // = 30
console.log(f1);

// or more briefly:
console.log(sumThree.curry2(3)(4)(20)(6)); // == 30