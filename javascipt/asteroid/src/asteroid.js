const Utils = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Game = require("./game.js");

function Asteroid(option) {
  MovingObject.call(this, { pos: option.pos, vel: Utils.randomVec(1), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: option.game });
}

Asteroid.COLOR = "#8BE371";
Asteroid.RADIUS = 40;

Utils.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObj) {
  if (otherObj instanceof Ship) {
    otherObj.relocate(this.game.randomPosition());
  } else {
    this.game.remove(this);
    this.game.remove(otherObj);
  }
}

module.exports = Asteroid;