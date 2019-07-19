const readline = require('readline');

let reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});


function teaAndBiscuits(...items) {
  const pickedItems = {};

  //asynchronous and recursive loop
  function askUserLoop(items) {
    // when no more items to ask
    if (items.length === 0) {
      displayFinalConfirmation(pickedItems);
      reader.close();
      return; 
    }
    
    askUser(items, pickedItems, askUserLoop);
  }

  askUserLoop(items);
}

function askUser(items, pickedItems, cbLoop) {
  reader.question(`Would you like some ${items[0]}? `, (res) => {
    // handle response 
    if (res == 'yes') {
      pickedItems[items[0]] = true;
    } else if (res == 'no') {
      pickedItems[items[0]] = false;
    } else {
      console.log("wrong input. Reply yes or no");
      cbLoop(items);
      return;
    }

    // display confirmation of individual item unless it's the final item
    if (items.length > 1) {
      displayConfirmation(res);
    }

    // ask for next item
    items.shift();
    cbLoop(items);
  });
}

function displayConfirmation(res) {
  console.log(`you replied \'${res}\'.`)
}

function displayFinalConfirmation(pickedItems) {
  const itemNames = Object.keys(pickedItems);
  let confirmation = "So";

  itemNames.forEach((name, idx) => {
    if (idx > 0) {
      confirmation += " and";
    }
    confirmation += " you";
    if (pickedItems[name]) {
      confirmation += " do";
    } else {
      confirmation += " don\'t";
    }
    confirmation += ` want ${name}`;
    if (idx == itemNames.length - 1) {
      confirmation += '.';
    }
  });
  console.log(confirmation);
}

teaAndBiscuits('tea', 'biscuits', 'candy');
