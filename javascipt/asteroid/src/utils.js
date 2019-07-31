// utility code, esp vector stuff

const Utils = {
  inherits: function inherits(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  }
}

module.exports = Utils;