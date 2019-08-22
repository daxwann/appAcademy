const Segment = require("./segment.js");

class Snake {
  constructor(startPos=[50,50]) {
    this.head = new Segment(startPos);
    this.growSize = 0;
  }

  turn(dir, seg=this.head) {
    const [x, y] = Snake.DIRECTIONS[dir];

    if (this.positions().length > 1 && dir === this.oppositeDir(this.dir)) {
      return;
    }
    seg.changeDir(vel);
  }

  oppositeDir(dir) {
    switch(dir) {
      case "S":
        return "N";
      case "N":
        return "S";
      case "E":
        return "W";
      case "W":
        return "E";
    }
  }

  move(seg=this.head) {
    seg.move();
  
    if (seg.back) {
      this.move(seg.back);
      seg.back.changeDir(seg.dir);
    }
  }

  addGrowSize() {
    this.growSize += Snake.GROWSIZE;
  }

  grow() {
    if (this.growSize <= 0) {
      return;
    }

    this.head.move();
    this.head.addToBack();
    this.growSize -= 1;
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
  "N": [0, -1],
  "E": [1, 0],
  "S": [0, 1],
  "W": [-1, 0] 
}

Snake.GROWSIZE = 5;

module.exports = Snake;