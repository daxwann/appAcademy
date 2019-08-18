const Snake = require("./snake.js");

class Board {
  constructor(x, y) {
    this.width = x;
    this.height = y;
    this.snake = new Snake([Math.floor(x / 2), Math.floor(y / 2)]);
    this.grid = this._createGrid(x, y);
  }

  _createGrid(x, y) {
    const grid = [];

    for (let i = 0; i < y; i++) {
      grid.push([]);
      for (let k = 0; k < x; k++) {
        grid[i].push([]);
      }
    }

    return grid;
  }

  placeSnakeOnBoard() {
    this.snake.positions.forEach((pos) => {
      const [x, y] = pos;

      this.grid[y][x] = "S";
    });
  }

  isInBound(pos) {
    const [x, y] = pos;

    if (x < 0 || y < 0 || x >= this.width || y >= this.height) {
      return false;
    }

    return true;
  }
}