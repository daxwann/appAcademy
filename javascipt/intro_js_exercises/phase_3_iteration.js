/* Array#bubbleSort - receives an array, returns a sorted array by implementing bubble sort sorting algorithm */

Array.prototype.bubbleSort = function() {
  let self = this;
  let sorted = false;
  let cycle = 0;

  while (sorted == false) {
    sorted = true;
    for (let i = 0; i < (self.length - 1 - cycle); i++) {
      if (self[i] > self[i + 1]) {
        /*
        let temp = self[i];
        self[i] = self[i + 1];
        self[i + 1] = temp; 
        */
        [self[i], self[i + 1]] = [self[i + 1], self[i]];
        sorted = false;
      }
    }
    cycle++;
  }

  return self;
};

/* String#substrings - receives a string, returns an array of all substrings */

String.prototype.substrings = function() {
  let substr = [];
  
  for (let start = 0; start < this.length; start++) {
    for (let end = start + 1; end <= this.length; end++) {
      substr.push(this.slice(start, end));
    }
  }

  return substr;
};
