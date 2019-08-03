const Game = require("./game.js");

function MovingObject(options) {
  console.log(options);
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2);
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  let [x, y] = this.pos;
  let [dx, dy] = this.vel;
  let newPos = [x + dx, y + dy];

  if (this.isWrappable()) {
  this.pos = this.game.wrap([x + dx, y + dy]);
  } else if (this.game.isOutOfBound(newPos)) {
    this.game.remove(this);
  } else {
    this.pos = newPos;
  }
}

MovingObject.prototype.isCollidedWith = function(otherObj) {
  let dX = Math.abs(this.pos[0] - otherObj.pos[0]);
  let dY = Math.abs(this.pos[1] - otherObj.pos[1]);
  let centerDist = Math.sqrt(dX ** 2 + dY ** 2);
  if (centerDist <= this.radius + otherObj.radius) {
    return true;
  }

  return false;
}

MovingObject.prototype.isWrappable = () => true;

module.exports = MovingObject;