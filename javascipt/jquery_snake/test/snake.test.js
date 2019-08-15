const Snake = require("../src/snake.js");

describe("Snake class", () => {
  const snake = new Snake();

  test("it has original direction of null", () => {
    expect(snake.direction).toBe(null);
  });

  test("it has a head positioned at [50, 50]", () => {
    expect(snake.head).toEqual(
      [
        {
          pos: [50, 50],
          dir: [0, 0],
          prev: null,
          next: null
        }
      ]
    );
  });

  test("Snake#turn(newDir) changes the direction", () => {
    snake.turn("E");
    expect(snake.direction).toEqual("E");
    expect(snake.head).toEqual(
      {
        head: null,
        tail: null,
        pos: [50, 50],
        dir: [1, 0]
      }
    )
  });

  test("Snake#move changes the position of head", () => {
    snake.move();
    expect(snake.head).toEqual(
      {
        head: null,
        tail: null,
        pos: [51, 50],
        dir: [1, 0]
      }
    );
  });

  test("Snake#addSegment() adds a segment to the tail of snake opposite the direction of snake", () => {
    snake.addSegment();
    expect(snake.head.next).toEqual(
      {
        prev: snake.head,
        next: null,
        pos: [50, 50],
        dir: [1, 0]
      }
    );
  });
});
