const View = require("./ttt-view.js");
const Game = require("./game.js");

$(() => {
  const $ttt = $(".ttt");
  const g = new Game();
  const v = new View(g, $ttt);
  v.setupBoard();
});
