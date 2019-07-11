/*Define a function isPrime(number) that returns true if number is prime. Otherwise, false. Assume number is a positive integer.*/

const isPrime = (num) => {
  if (num == 0 || num == 1) return false;
  if (num == 2) return true;
  if (num % 2 == 0) return false;

  for (let i = 3; i <= num / 2; i += 2) {
    if (num % i == 0) return false; 
  }

  return true;
};

console.log(isPrime(2)) // true
console.log(isPrime(10)) // false
console.log(isPrime(15485863)) // true
console.log(isPrime(3548563)) // false
