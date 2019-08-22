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

  test("Snake#addGrowSize adds number of segments to be added", () => {
    snake.addGrowSize();
    expect(snake.growSize).toBe(5);
  })

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
    expect(snake.growSize).toBe(4);
  });

  test("Snake#positions returns array of all positions of snake in order", () => {
    snake.grow();
    snake.grow();
    snake.grow();
    snake.grow();
    const positions = snake.positions();
    expect(positions).toEqual([[56, 50], [55, 50], [54, 50], [53, 50], [52, 50], [51, 50]]);
  });

  test("Snake#hasEatenItself returns true if head collides with body", () => {
    snake.grow();
    snake.turn("N");
    snake.move();
    snake.turn("W");
    snake.move();
    snake.turn("S");
    snake.move();
    expect(snake.hasEatenItself()).toBeTruthy();
  })
});
