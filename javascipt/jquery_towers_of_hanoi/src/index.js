const HanoiGame = require("./hanoi_game.js");
const HanoiView = require("./hanoi_view.js");

$(() => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
