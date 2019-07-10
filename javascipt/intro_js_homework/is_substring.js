const isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
}

console.log(isSubstring("Mr Fox is running down a hill", "Fox")); // true
console.log(isSubstring("Take care of your mind and body", "bodies")); //false
