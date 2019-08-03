const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");
const Ship = require("./ship.js");

function Bullet(options) {
  console.log(options);
  MovingObject.call(this, {pos: options.pos, vel: options.vel, radius: Bullet.RADIUS, color: Bullet.COLOR, game: options.game});
}

Utils.inherits(Bullet, MovingObject);

Bullet.RADIUS = 5;
Bullet.COLOR = "#FF2200";

Bullet.prototype.move = function() {
  let [x, y] = this.pos;
  let [dx, dy] = this.vel;
  let newPos = [x + dx, y + dy];

  if (this.game.isOutOfBound(newPos)) {
    this.game.remove(this);
  } else {
    this.pos = [x + dx, y + dy];
  }
};

module.exports = Bullet;
