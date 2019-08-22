const Board = require("../src/board.js");

describe("Board class", () => {
  const bd = new Board(100, 100);

  test("board is sized 100 by 100", () => {
    expect(bd.grid.length).toBe(100);
    expect(bd.grid[0].length).toBe(100);
  })

  test("board has an apple with position within boundary", () => {
    const [x, y] = bd.apple.pos;
    expect(x >= 0 && x < bd.width).toBeTruthy();
    expect(y >= 0 && y < bd.height).toBeTruthy();
  })

  test("Board#isInBound(pos)", () => {
    expect(bd.isInBound([100, 99])).toBeFalsy();
  })

  test("Board#isSnakeInBound", () => {
    bd.snake.head.pos = [100, 99];
    expect(bd.isSnakeInBound()).toBeFalsy();
  })

  test("Board#didSnakeEatApple", () => {
    bd.apple.pos = [60, 60];
    bd.snake.head.pos = [60, 60];
    expect(bd.didSnakeEatApple()).toBeTruthy();
  })
})