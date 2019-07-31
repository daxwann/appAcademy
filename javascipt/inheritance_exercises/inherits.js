// Write a Function.prototype.inherits method that will 
// do this for you. Do not use Object.create right now; 
// you should deeply understand what the new keyword does 
// and how the __proto__ chain is constructed. 

Function.prototype.inherits = function(parentClass) {
  let childClass = this;

  /*
  let Surrogate = function(){};

  Surrogate.prototype = parentClass.prototype;
  childClass.prototype = new Surrogate();
  childClass.prototype.constructor = childClass;
  */

  childClass.prototype = Object.create(parentClass.prototype);
  childClass.prototype.constructor = childClass;
};

// test

function MovingObject(speed) {
  this.speed = speed;
}

MovingObject.prototype.changeDirection = function() {
  console.log("Object has changed direction.");
}

function Asteroid(size, speed) {
  MovingObject.call(this, speed);
  this.size = size;
}

Asteroid.inherits(MovingObject);

Asteroid.prototype.split = function() {
  console.log("Astroid has split.");
}

let ast = new Asteroid(1, 5);
console.log(ast.speed); // 5
console.log(ast.size); // 1;
ast.changeDirection(); // Object has changed direction
ast.split(); // Asteroid has split

function Ship(name, speed) {
  MovingObject.call(this, speed);
  this.name = name;
}

Ship.inherits(MovingObject);

Ship.prototype.accelerate = function() {
  console.log("Ship is accelerating");
};

let voyager = new Ship("voyager", 0);
console.log(voyager.speed); // 0
console.log(voyager.name); // voyager
voyager.changeDirection(); // Object has changed direction
voyager.accelerate(); // Ship is accelerating

// voyager.split(); // TypeError
// ast.accelerate(); // TypeError
// MovingObject.accelerate(); // TypeError

