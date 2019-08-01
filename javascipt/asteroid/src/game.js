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

Game.prototype.checkCollision = function() {
  this.asteroids.forEach((ast1, idx1) => {
    this.asteroids.forEach((ast2, idx2) => {
      if (idx2 <= idx1) {
        return;
      }

      if (ast1 === ast2) {
        return;
      }

      if (ast1.isCollidedWith(ast2)) {
        ast1.collideWith(ast2);
      }
    });
  });
};

Game.prototype.remove = function(asteroid) {
  this.asteroids = this.asteroids.filter((ast) => {
      return ast !== asteroid;
  });
};

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollision();
};

module.exports = Game;