const Board = require("../src/board.js");
const Disk = require("../src/disk.js");

test("initiates 3 towers in a 2d array", () => {
  let bd = new Board();
  expect(bd.towers).toEqual([
    [
      { size: 3 },
      { size: 2 },
      { size: 1 }
    ], 
    [], 
    []
  ]);
});
