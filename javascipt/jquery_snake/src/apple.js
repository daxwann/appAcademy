class Apple {
  constructor() {
    this.pos = null;
  }

  randPos(bd) {
    let x = 0;
    let y = 0;

    do {
      x = Math.floor(bd.width * Math.random());
      y = Math.floor(bd.height * Math.random());
    } while (bd.grid[y][x] !== null);

    this.pos = [x, y];
    return [x, y];
  }
}

module.exports = Apple;