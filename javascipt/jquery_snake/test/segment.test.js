const Segment = require("../src/segment.js");

describe("Segment class", () => {
  const head = new Segment([50, 50]);

  test("new head has no prev or next segment, no direction", () => {
    expect(head).toEqual(
      {
        pos: [50, 50],
        dir: [0, 0],
        front: null,
        back: null
      }
    )
  });

  test("Segment#changeDir(dir) updates the dir of segment", () => {
    head.changeDir([1, 0]);
    expect(head.dir).toEqual(
      [1, 0]
    )
  });

  test("Segment#move changes the pos based on dir", () => {
    head.move();
    expect(head.pos).toEqual(
      [51, 50]
    )
  });

  test("Segment#addToBack() adds new segment behind the head in its previous position", () => {
    head.addToBack();

    const seg2 = head.back;
    expect(seg2).toEqual(
      {
        pos: [50, 50],
        dir: [1, 0],
        front: head,
        back: null
      }
    );
  });
})