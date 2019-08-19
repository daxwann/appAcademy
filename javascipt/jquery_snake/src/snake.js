const Segment = require("./segment.js");

class Snake {
  constructor(startPos=[50,50]) {
    this.head = new Segment(startPos);
  }

  turn(dir, seg=this.head) {
    const vel = Snake.DIRECTIONS[dir];
    seg.changeDir(vel);
  }

  move(seg=this.head) {
    seg.move();
  
    if (seg.back) {
      this.move(seg.back);
      seg.back.changeDir(seg.dir);
    }
  }

  grow() {
    this.head.move();
    this.head.addToBack();
  }

  positions(start=this.head) {
    const positions = [];

    while (start) {
      positions.push(start.pos);
      start = start.back;
    }

    return positions;
  }

  hasEatenItself() {
    const bodyPos = this.positions(this.head.back);

    return bodyPos.some((pos) => {
      return JSON.stringify(pos) === JSON.stringify(this.head.pos);
    });
  }
}

Snake.DIRECTIONS = {
  "N": [0, 1],
  "E": [1, 0],
  "S": [0, -1],
  "W": [-1, 0] 
}

module.exports = Snake;