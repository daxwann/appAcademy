const GameView = require("./game_view.js");

document.addEventListener("DOMContentLoaded", (e) => {
  const gv = new GameView();
  gv.start();
});