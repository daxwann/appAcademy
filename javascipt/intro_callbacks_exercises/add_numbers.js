/* Let's write a function that will read several numbers, one after another, and sum up the total. After each number, let's print out the partial sums along the way, and pass the total sum to a callback when done. */

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function addNumbers(sum, numsLeft, completionCallBack) {
  if (numsLeft === 0) {
    completionCallBack(sum);
    reader.close();
    return;
  }

  reader.question("What\'s a number you want to add? ", (res) => {
    const parsedNum = parseInt(res);  

    if (isNaN(parsedNum)) {
      console.log("User input should be an integer");
      addNumbers(sum, numsLeft, completionCallBack);
      return;
    }

    sum += parsedNum;
    numsLeft--;
    
    if (numsLeft > 0) {
      console.log(`The sum right now is ${sum}`);
    }

    addNumbers(sum, numsLeft, completionCallBack);
  });
}

addNumbers(0, 3, (sum) => console.log(`Final sum is ${sum}`));
