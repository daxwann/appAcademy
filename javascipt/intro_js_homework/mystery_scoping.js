function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x); // 'in block'
  }
  console.log(x); // 'in block'
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x); // 'in block'
  }
  console.log(x); // 'out of block'
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x); // SyntaxError: Identifier 'x' has already been declared
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x); // 'in block'
  }
  console.log(x); // 'out of block'
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x); // SyntaxError: Identifier 'x' has already been declared
}
