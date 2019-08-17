const Snake = require("../src/snake.js");

describe("Snake class", () => {
  const snake = new Snake();

  test("it has a head positioned at [50, 50] with dir of [0, 0]", () => {
    expect(snake.head).toEqual(
      {
        pos: [50, 50],
        dir: [0, 0],
        front: null,
        back: null
      }
    );
  });

  test("Snake#turn(newDir) changes the direction", () => {
    snake.turn("E");
    expect(snake.head).toEqual(
      {
        front: null,
        back: null,
        pos: [50, 50],
        dir: [1, 0]
      }
    )
  });

  test("Snake#move changes the position of entire snake", () => {
    snake.move();
    expect(snake.head).toEqual(
      {
        front: null,
        back: null,
        pos: [51, 50],
        dir: [1, 0]
      }
    );
  });

  test("Snake#grow() adds one segment behind the head of the snake as it moves", () => {
    snake.grow();
    expect(snake.head.pos).toEqual(
      [52, 50]
    )
    expect(snake.head.back).toEqual(
      {
        front: snake.head,
        back: null,
        pos: [51, 50],
        dir: [1, 0]
      }
    );
  });
});
