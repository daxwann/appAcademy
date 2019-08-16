class Segment {
  constructor(pos, dir, prev=null) {
    this.pos = pos,
    this.dir = dir,
    this.prev = prev,
    this.next = null
  }

  changeDir(dir) {
    this.dir = dir;
  }

  move() {
    const [x, y] = this.pos;
    const [dx, dy] = this.dir;

    this.pos = [x + dx, y + dy];
  }

  addNext() {
    if (this.dir === [0, 0]) {
      return null;
    }

    const [x, y] = this.pos;
    const [dx, dy] = this.dir;
    const newSegPos = [x - dx, y - dy];

    this.next = new Segment(newSegPos, this.dir, this);
  }
}

module.exports = Segment;