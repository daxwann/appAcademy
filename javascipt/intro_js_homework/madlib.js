/*Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.*/

const madLib = (verb, adj, noun) => {
  return `We shall ${verb} the ${adj} ${noun}!!!`;
}

console.log(madLib('make', 'best', 'guac'));
