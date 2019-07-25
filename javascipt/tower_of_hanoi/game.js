const readline = require('readline');
const board = require('./board.js');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

class Game {
  constructor() {
    this.board = new board;
  }

  run() {
    // Until all disks are moved to last tower:
    //  1. prints stack
    //  2. ask user for move
    //  3. move disk from starting position to ending position
    // Invoke completionCallback 
    this.board.display();
    
    if (this.board.isWon()) {
      this.completionCallback();
      reader.close();
      return;
    }

    this.askForStartIdx();
  }

  askForStartIdx() {
    reader.question("Please enter tower number where you want to move disk from: ", (res) => {
      let startTower = parseInt(res);
      // check input to be between 1 and 3
      if (isNaN(startTower) || startTower < 1 || startTower > 3 ) {
        console.log("Please enter number between 1 to 3");
        this.askForStartIdx();
        return;
      }

      let startIdx = startTower - 1;

      // check if selected tower has disk to move 
      if (this.board.towers[startIdx].length === 0) {
        console.log(`Tower ${startTower} is empty`);
        this.askForStartIdx();
        return;
      }
      // ask for tower to move to
      this.askForEndIdx(startIdx, (startIdx, endIdx) => {
        this.board.moveDisk(startIdx, endIdx);
        this.run();
      }); 
    });
  }

  askForEndIdx(startIdx, cb) {
    reader.question("Please enter tower number where you want to move disk to: ", (res) => {
      let endTower = parseInt(res);

      if (isNaN(endTower) || endTower < 1 || endTower > 3 ) {
        console.log("Please enter number between 1 to 3");
        this.askForEndIdx(startIdx, cb);
        return;
      }

      let endIdx = endTower - 1;

      if (!this.board.isValidMove(startIdx, endIdx)) {
        console.log("Invalid move");
        this.askForStartIdx();
        return;
      }

      cb(startIdx, endIdx); 
    });
  }
}

let game = new Game;
game.run();
