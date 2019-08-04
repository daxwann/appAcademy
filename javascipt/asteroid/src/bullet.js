const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");
const Ship = require("./ship.js");

function Bullet(options) {
  MovingObject.call(this, {pos: options.pos, vel: options.vel, radius: Bullet.RADIUS, color: Bullet.COLOR, game: options.game});
}

Utils.inherits(Bullet, MovingObject);

Bullet.RADIUS = 5;
Bullet.COLOR = "#FF2200";

Bullet.prototype.isWrappable = () => false;

module.exports = Bullet;
