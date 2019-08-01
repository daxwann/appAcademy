const Asteroid = require("./asteroid.js");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = window.innerWidth;
Game.DIM_Y = window.innerHeight;
Game.NUM_ASTEROIDS = 5;

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let ast = new Asteroid( { pos: this.randomPosition(), game: this} );
    this.asteroids.push(ast);
    console.log(`added new ast in ${ast.pos}`);
  }
}

Game.prototype.randomPosition = function() {
  let x = Math.random() * Game.DIM_X;
  let y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach((ast) => {
    ast.draw(ctx);
    console.log(`drew asteroid at position ${ast.pos}`);
  });
};

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((ast) => {
    ast.move();
  });
};

Game.prototype.wrap = function(pos) {
  let [x, y] = pos;
  if (x > Game.DIM_X) {
    x = 0;
  }

  if (x < 0) {
    x = Game.DIM_X;
  }

  if (y > Game.DIM_Y) {
    y = 0;
  }

  if (y < 0) {
    y = Game.DIM_Y;
  }

  return [x, y];
}

module.exports = Game;