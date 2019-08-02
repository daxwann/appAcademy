const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Ship(option) {
  MovingObject.call(this, {pos: option.pos, vel: [0, 0], radius: Ship.RADIUS, color: Ship.COLOR, game: option.game});
}

Ship.COLOR = "#797BE8";
Ship.RADIUS = 10;

Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function(newPos) {
  this.pos = newPos;
};

Ship.prototype.power = function(impulse) {
  this.vel = [this.vel[0] + impulse[0], this.vel[1] + impulse[1]];
};

module.exports = Ship;