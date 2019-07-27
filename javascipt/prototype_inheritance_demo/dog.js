const Animal = require('animal');

function Dog(name) {
  Animal.call(this, name);
}



module.exports = Dog;
