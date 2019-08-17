class Segment {
  constructor(pos, dir=[0, 0], front=null) {
    this.pos = pos,
    this.dir = dir,
    this.front = front,
    this.back = null
  }

  changeDir(dir) {
    this.dir = dir;
  }

  move() {
    const [x, y] = this.pos;
    const [dx, dy] = this.dir;

    this.pos = [x + dx, y + dy];
  }

  addToBack() {
    // disable functionality when not moving
    if (this.dir === [0, 0]) {
      return null;
    }

    const [x, y] = this.pos;
    const [dx, dy] = this.dir;
    const newSegPos = [x - dx, y - dy];
    const prevBack = this.back;

    // create new segment behind current segment
    this.back = new Segment(newSegPos, this.dir, this);

    // link rest of snake to new segment
    if (prevBack) {
      prevBack.front = this.back;
    }
  }
}

module.exports = Segment;