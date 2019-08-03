// utility code, esp vector stuff

const Utils = {
  inherits: function(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },

  controlledVec: function(dir, speed) {
    const deg = 2 * Math.PI * dir;
    return Utils.scale([Math.sin(deg), Math.cos(deg)], speed);
  },

  scale: function(vec, mag) {
    return [vec[0] * mag, vec[1] * mag];
  }
}

module.exports = Utils;