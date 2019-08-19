const Snake = require("./snake.js");
const Apple = require("./apple.js");

class Board {
  constructor(x, y) {
    this.width = x;
    this.height = y;
    this.snake = new Snake([Math.floor(x / 2), Math.floor(y / 2)]);
    this.grid = Board.makeGrid(x, y);
  }

  placeSnakeOnBoard() {
    this.snake.positions.forEach((pos) => {
      const [x, y] = pos;

      this.grid[y][x] = "S";
    });
  }

  clear() {
    this.grid.forEach((row) => {
      row = row.map(tile => null);
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