// Write your own `myBind(context)` method. Add it to `Function.prototype`. 
// You'll want to:

// 1. Return an arrow function.
// 2. The arrow function captures this and context.
// 3. In the anonymous function, call `Function.prototype.apply` 
//    on `this`, passing the context.

Function.prototype.myBind = function(context) {
  const fn = this;

  return () => {
    fn.apply(context);
  };
}

// test

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
