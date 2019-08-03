const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Ship(option) {
  MovingObject.call(this, {pos: option.pos, vel: [0, 0], radius: Ship.RADIUS, color: Ship.COLOR, game: option.game});
  this.dir = 0.25;
  this.speed = 0;
}

Ship.COLOR = "#797BE8";
Ship.RADIUS = 10;

Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function(newPos) {
  this.pos = newPos;
};

Ship.prototype.accelerate = function() {
  if (this.speed < 50) {
    this.speed += 0.1;
  }
  this.vel = Utils.controlledVec(this.dir, this.speed);
};

Ship.prototype.deccelerate = function() {
  if (this.speed > 0) {
    this.speed -= 0.1;
  }
  this.vel = Utils.controlledVec(this.dir, this.speed);
};

Ship.prototype.turnLeft = function() {
  this.dir = Math.round(((1 + (this.dir + 0.01) % 1) % 1) * 100) / 100;
  this.vel = Utils.controlledVec(this.dir, this.speed);
  console.log(this.dir);
};

Ship.prototype.turnRight = function() {
  this.dir = Math.round(((1 + (this.dir - 0.01) % 1) % 1) * 100) / 100;
  this.vel = Utils.controlledVec(this.dir, this.speed);
  console.log(this.dir);
};

Ship.prototype.fire = function() {
  
}

module.exports = Ship;