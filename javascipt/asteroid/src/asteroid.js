const Utils = require("./utils.js");
const MovingObject = require("./moving_object.js");

function Asteroid(option) {
  MovingObject.call(this, { pos: option.pos, vel: Utils.randomVec(1), radius: Asteroid.RADIUS, color: Asteroid.COLOR, game: option.game });
}

Asteroid.COLOR = "#8BE371";
Asteroid.RADIUS = 40;

Utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;