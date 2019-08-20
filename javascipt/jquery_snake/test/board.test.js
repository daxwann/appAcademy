const Board = require("../src/board.js");

describe("Board class", () => {
  const bd = new Board(100, 100);

  test("board is sized 100 by 100", () => {
    expect(bd.grid.length).toBe(100);
    expect(bd.grid[0].length).toBe(100);
  })

  test("board has 'S' positioned at coordinate [50, 50]", () => {
    expect(bd.grid[50][50]).toBe("S");
  })

  test("board has an apple with position within boundary", () => {
    const [x, y] = bd.apple.pos;
    expect(x >= 0 && x < bd.width).toBeTruthy();
    expect(y >= 0 && y < bd.height).toBeTruthy();
  })

  test("Board#clear clears the board", () => {
    bd.clear();
    expect(bd.grid.every((row) => {
      return row.every(tile => tile === null);
    })).toBeTruthy();
  })

  test("Board#placeSnake puts snake on board", () => {
    bd.placeSnake();
    expect(bd.grid[50][50]).toBe("S");
  })

  test("Board#isInBound(pos)", () => {
    bd.snake.pos = [100, 99];
    expect(bd.isInBound(bd.snake.pos)).toBeFalsy();
  })
})