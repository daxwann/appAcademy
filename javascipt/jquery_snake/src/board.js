const Snake = require("./snake.js");
const Apple = require("./apple.js");

class Board {
  constructor(x, y) {
    this.width = x;
    this.height = y;
    this.snake = new Snake([Math.floor(x / 2), Math.floor(y / 2)]);
    this.grid = Board.makeGrid(x, y);
    this.apple = new Apple();
    this.placeObjects();
  }

  placeObjects() {
    this.placeSnake();
    this.placeApple();
  }

  placeSnake() {
    this.snake.positions().forEach((pos) => {
      const [x, y] = pos;

      if (JSON.stringify(pos) === JSON.stringify(this.apple.pos)) {
        this.apple.pos = null;
      }

      this.grid[y][x] = "S";
    });
  }

  isMatchingPos(pos1, pos2) {
    return JSON.stringify(pos1) === JSON.stringify(this.pos2);
  }

  placeApple() {
    const [x, y] = this.apple.pos || this.apple.randPos(this);
    this.grid[y][x] = "A";
  }

  clear() {
    this.grid.forEach((row, idx) => {
      this.grid[idx] = row.map(tile => null);
    })
  }

  isInBound(pos) {
    const [x, y] = pos;

    if (x < 0 || y < 0 || x >= this.width || y >= this.height) {
      return false;
    }

    return true;
  }

  static makeGrid(x, y) {
    const grid = [];

    for (let i = 0; i < y; i++) {
      grid.push([]);
      for (let k = 0; k < x; k++) {
        grid[i].push(null);
      }
    }

    return grid;
  }
}

module.exports = Board;