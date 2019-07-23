/* In this exercise, we write a method called absurdBubbleSort(arr, sortCompletionCallback). Instead of using the traditional >, we'll prompt the user to perform each comparison for us. */

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function absurdBubbleSort(arr, sortCompletionCallback) {
  let madeAnySwaps = true;
  let cycle = 0;

  function outerBubbleSortLoop(madeAnySwaps, cycle) {
    if (madeAnySwaps == false) {
      sortCompletionCallback(arr);
      reader.close();
      return;
    }

    let i = 0;
    madeAnySwaps = false;
    innerBubbleSortLoop(arr, i, cycle, madeAnySwaps, outerBubbleSortLoop);
  }

  outerBubbleSortLoop(madeAnySwaps, cycle);
}

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? `, (res) => {
    if (res == 'yes') {
      callback(true);
    } else if (res == 'no') {
      callback(false);
    } else {
      console.log("Answer must be yes or no");
      askIfGreaterThan(el1, el2, callback);
    }
  });
}

function innerBubbleSortLoop(arr, i, cycle, madeAnySwaps, outerBubbleSortLoop) {
  if (i === arr.length - 1 - cycle) {
    cycle++;
    outerBubbleSortLoop(madeAnySwaps, cycle);
  } else if (i < arr.length - 1 - cycle) {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i + 1], arr[i]] = [arr[i], arr[i + 1]];
        madeAnySwaps = true;
        innerBubbleSortLoop(arr, i + 1, cycle, madeAnySwaps, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(arr, i + 1, cycle, madeAnySwaps, outerBubbleSortLoop);
      }
    });
  } 
}

absurdBubbleSort([20, 3, 2, 4, 1], (arr) => {
  console.log(`${arr} is sorted`);
});
