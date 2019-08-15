const Snake = require("snake.js");

describe("Snake class", () => {
  const snake = new Snake();

  test("it has original direction of null", () => {
    expect(snake.direction).toBe(null);
  });

  test("it has initial 1 segment positioned at [50, 50]", () => {
    expect(snake.segment).toEqual([[50, 50]]);
  });

  test("Snake#turn(newDir) changes the direction", () => {
    snake.turn("N");
    expect(snake.direction).toBe("N");
    snake.turn("E");
    expect(snake.direction).toBe("E");
  });
});
