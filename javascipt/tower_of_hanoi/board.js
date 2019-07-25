const Disk = require('./disk.js');

class Board {
  constructor() {
    this.towers = [[], [], []];
    this.towers[0] = [new Disk(3), new Disk(2), new Disk(1)];
  }

  isValidMove(startIdx, endIdx) {
    let startTowerLength = this.towers[startIdx].length;
    let endTowerLength = this.towers[endIdx].length; 

    // starting tower has to have at least one disk
    if (startTowerLength === 0) {
      return false;
    }

    // starting and ending tower have to be side by side
    if (Math.abs(startIdx - endIdx) !== 1) {
      return false;
    }

    if (endTowerLength === 0) {
      return true;
    }

    // only smaller disks can be on top of bigger disks
    if (this.towers[startIdx][startTowerLength - 1].size < this.towers[endIdx][endTowerLength - 1].size) {
      return true;
    }

    return false;
  }

  moveDisk(startIdx, endIdx) {
    let disk = this.towers[startIdx].pop();     
    this.towers[endIdx].push(disk); 
  }

  isWon(){
    if (this.towers[2].length === 3) {
      return true;
    }

    return false;
  }

  display() {
    for (let i = 2; i >= 0; i--) {
      let rowStr = " ";
      for (let j = 0; j <= 2; j++) {
        if (this.towers[j][i]) {
          rowStr += this.towers[j][i].toStr(); 
        } else {
          rowStr += '|';
        }
        rowStr += " ";
      }
      console.log(rowStr);
    };
    console.log(" - - - ");
    console.log(" 1 2 3 ");
  }
}

module.exports = Board;
// test
/*
let bd = new Board;
bd.display();
console.log("move disk");
bd.moveDisk(0, 1);
bd.display();
console.log(bd.isValidMove(0, 1));
console.log(bd.isValidMove(1, 2));

*/
