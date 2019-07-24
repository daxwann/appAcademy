// In a debounced function, the specified interval represents 
// how much time must pass without the debounced function 
// being invoked, before the original function is invoked automatically. 
// Write your own myDebounce function on the Function.prototype. 
// It should take an interval as an argument and return a 
// "debounced" version of the original function.

Function.prototype.myDebounce = function(interval) {
  const fn = this;
  let callTimer;

  function startFnCallTimer(...args) {
    callTimer = global.setTimeout((...args) => {
      fn(...args);
    }, interval); 
  }

  return (...args) => {
    global.clearTimeout(callTimer);
    startFnCallTimer(...args);
  };
};

// test

class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

const searchBar = new SearchBar;

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
}

queryForHelloWorld();

console.log("---Debounce search---");

searchBar.query = "";
searchBar.search = searchBar.search.myDebounce(500);

queryForHelloWorld();
