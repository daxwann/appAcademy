const Game = require("./game.js");

function GameView() {
  this.game = new Game();
  this.ctx = this.setContext();
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
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
  key('w', () => {
    this.game.ship.accelerate();
  });

  key('s', () => {
    this.game.ship.deccelerate();
  });

  key('a', () => {
    this.game.ship.turnLeft();
  });

  key('d', () => {
    this.game.ship.turnRight();
  });

  key('k', () => {
    this.game.ship.fire();
  })
};

module.exports = GameView;