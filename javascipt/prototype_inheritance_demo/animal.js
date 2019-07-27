function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function() {
  console.log("yum yum");
};

module.exports = Animal;
