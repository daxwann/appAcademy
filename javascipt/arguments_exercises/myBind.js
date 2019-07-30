// using arguments object
Function.prototype.myBind1 = function() {
  let fn = this;
  let bindArgs = Array.from(arguments);
  let context = bindArgs[0] || fn.caller;

  return function() {
    const callArgs = Array.from(arguments);
    fn.apply(context, bindArgs.slice(1).concat(callArgs));
  };
}

// using rest operator
Function.prototype.myBind2 = function(ctx, ...bindArgs) {
  let fn = this;
  let context = ctx || fn.caller;

  return (...callArgs) => {
    fn.apply(context, bindArgs.concat(callArgs));
  };
}

// test
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind1(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind1(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind1(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind1(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true