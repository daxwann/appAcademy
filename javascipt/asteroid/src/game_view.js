const Game = require("./game.js");

function GameView() {
  this.game = new Game();
  this.ctx = this.setContext();
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  }, 20);
}

GameView.prototype.setContext = function() {
  const canvas = document.getElementById("game-canvas");
  canvas.height = window.innerHeight;
  canvas.width = window.innerWidth;

  const ctx = canvas.getContext("2d");
  return ctx;
};

GameView.prototype.bindKeyHandlers = function() {

};

module.exports = GameView;