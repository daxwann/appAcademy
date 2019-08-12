const board = require('./board.js');

class HanoiGame {
  constructor() {
    this.board = new board;
  }

  run(reader, completionCallback) {
    // Until all disks are moved to last tower:
    //  1. prints stack
    //  2. ask user for move
    //  3. move disk from starting position to ending position
    // Invoke completionCallback 
    this.board.display();
    
    if (this.board.isWon()) {
      completionCallback();
      return;
    }

    this.askForStartIdx(reader, completionCallback);
  }

  askForStartIdx(reader, completionCallback) {
    reader.question("Please enter tower number where you want to move disk from: ", (res) => {
      let startTower = parseInt(res);
      // check input to be between 1 and 3
      if (isNaN(startTower) || startTower < 1 || startTower > 3 ) {
        console.log("Please enter number between 1 to 3");
        this.askForStartIdx(reader, completionCallback);
        return;
      }

      let startIdx = startTower - 1;

      // check if selected tower has disk to move 
      if (this.board.towers[startIdx].length === 0) {
        console.log(`Tower ${startTower} is empty`);
        this.askForStartIdx(reader, completionCallback);
        return;
      }
      // ask for tower to move to
      this.askForEndIdx(reader, startIdx, completionCallback, (startIdx, endIdx) => {
        this.board.moveDisk(startIdx, endIdx);
        this.run(reader, completionCallback);
      }); 
    });
  }

  askForEndIdx(reader, startIdx, completionCallback, cb) {
    reader.question("Please enter tower number where you want to move disk to: ", (res) => {
      let endTower = parseInt(res);

      if (isNaN(endTower) || endTower < 1 || endTower > 3 ) {
        console.log("Please enter number between 1 to 3");
        this.askForEndIdx(reader, startIdx, completionCallback, cb);
        return;
      }

      let endIdx = endTower - 1;

      if (!this.board.isValidMove(startIdx, endIdx)) {
        console.log("Invalid move");
        this.askForStartIdx(reader, completionCallback);
        return;
      }

      cb(startIdx, endIdx); 
    });
  }
}

module.exports = HanoiGame;
