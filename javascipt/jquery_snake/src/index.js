const GameView = require("./game_view.js");

$(() => {
  const $root = $(".snake-game");
  const gameView = new GameView($root);
});
