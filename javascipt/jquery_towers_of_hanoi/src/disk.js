class Disk {
  constructor(size) {
    this.size = size;
  }

  toStr() {
    return this.size.toString(); 
  }
}

module.exports = Disk;

// test
/*
let disk1 = new Disk(1);
console.log(disk1.toStr());
*/

