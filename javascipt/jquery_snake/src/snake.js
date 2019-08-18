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
  
    if (seg.prev) {
      this.move(seg.prev);
      seg.prev.changeDir(this.dir);
    }
  }

  grow() {
    this.head.move();
    this.head.addToBack();
  }

  positions() {
    const positions = [];
    let seg = this.head

    while (seg) {
      positions.push(seg.pos);
      seg = seg.back;
    }

    return positions;
  }

  hasEatenItself() {
    const behindHeadPos = this.positions.slice(1);

    behindHeadPos.forEach((pos) => {
      if (JSON.stringify(pos) === JSON.stringify(this.head.pos)) {
        return true;
      }
    });

    return false;
  }
}

Snake.DIRECTIONS = {
  "N": [0, 1],
  "E": [1, 0],
  "S": [0, -1],
  "W": [-1, 0] 
}

module.exports = Snake;