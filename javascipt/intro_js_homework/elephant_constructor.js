const Elephant = function(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRR!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12; 
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  const randIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[randIndex]}`);
}

let tammy = new Elephant('Tammy', 10, ['playing games', 'singing']);
tammy.trumpet(); // Tammy the elephant goes 'phrRRRRRRRR!!!'
console.log(tammy.height); // 10
tammy.grow();
console.log(tammy.height); // 22
tammy.addTrick('dancing');
console.log(tammy.tricks); // ['playing games', 'singing', 'dancing']
tammy.play();
