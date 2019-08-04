const Game = require("./game.js");

function GameView() {
  this.game = new Game();
  this.ctx = this.setContext();
  this.lastTime = 0;
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
  window.requestAnimationFrame(this.animate.bind(this));
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

GameView.prototype.animate = function(timeStamp) {
  let timeDelta = timeStamp - this.lastTime;
  this.game.moveObjects(timeDelta);
  this.game.checkCollision();
  this.game.draw(this.ctx);
  this.lastTime = timeStamp;
  window.requestAnimationFrame(this.animate.bind(this));
};

module.exports = GameView;