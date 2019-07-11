/*Write a function titleize that takes an array of names and a function (callback). titleize should use Array.prototype.map to create a new array full of titleized versions of each name - titleize meaning "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this new array of names to the callback, which should use Array.prototype.forEach to print out each titleized name.*/

const printName = (name) => {
  console.log(name);
};

const titleize = (arr, cb) => {
  let titleized_arr = arr.map((name) => {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  titleized_arr.forEach((name) => {
    cb(name);
  });
};

titleize(['Mary', 'Joseph', 'Tony'], printName);
