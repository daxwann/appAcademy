const Disk = require('./disk.js');

class Board {
  constructor() {
    this.towers = [[], [], []];
    this.towers[0] = [new Disk(3), new Disk(2), new Disk(1)];
  }

  moveDisk(startIdx, endIdx) {
    let disk = this.towers[startIdx].pop();     
    this.towers[endIdx].push(disk); 
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
*/
