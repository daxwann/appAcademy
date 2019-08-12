const Game = require('./game.js');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

let gm = new Game();
gm.run(reader, completion);

function completion() {
  reader.question("Do you want to play again y/n? ", (res) => {
    if (res.toLowerCase() == 'y') {
      gm = new Game();
      gm.run(reader, completion);
    } else if (res.toLowerCase() == 'n') {
      console.log("goodbye");
      reader.close();
    } else {
      console.log("enter y or n");
      completion();
    }
  });
}

