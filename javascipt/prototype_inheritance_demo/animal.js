function Animal(name) {
  this.name = name;
}

Animal.prototype.eats = function() {
  console.log("yum yum");
};

module.exports = Animal;
