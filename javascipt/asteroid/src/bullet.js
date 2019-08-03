const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

function Bullet(option) {
  MovingObject.call({ pos: option.pos, vel: option.vel, radius: Bullet.RADIUS, color: Bullet.COLOR });
}

Utils.inherits(Bullet, MovingObject);

Bullet.RADIUS = 1;
Bullet.COLOR = "#FF2200";