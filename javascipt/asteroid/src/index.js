const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

document.addEventListener("DOMContentLoaded", (e) => {
  const canvas = document.getElementById("game-canvas");
  canvas.height = window.innerHeight;
  canvas.width = window.innerWidth;

  const ctx = canvas.getContext("2d");
  let mo1 = new MovingObject({ pos: [200, 200], vel: [100, 300], radius: 20, color: "#2f2" });
  mo1.draw(ctx);
  mo1.move();
  mo1.draw(ctx);
});

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;