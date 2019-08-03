const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({pos: this.centerPosition(), game: this});
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

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
};

Game.prototype.randomPosition = function() {
  let x = Math.random() * Game.DIM_X;
  let y = Math.random() * Game.DIM_Y;
  return [x, y];
};

Game.prototype.centerPosition = function() {
  let x = 0.5 * Game.DIM_X;
  let y = 0.5 * Game.DIM_Y;
  return [x, y];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  let allObj = this.allObjects();
  allObj.forEach((obj) => {
    obj.draw(ctx);
  });
};

Game.prototype.moveObjects = function() {
  let allObj = this.allObjects();
  allObj.forEach((obj) => {
    obj.move();
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
  let allObj = this.allObjects();
  this.asteroids.forEach((ast, idx1) => {
    allObj.forEach((obj, idx2) => {
      if (idx2 <= idx1) {
        return;
      }

      if (ast === obj) {
        return;
      }

      if (ast.isCollidedWith(obj)) {
        ast.collideWith(obj);
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