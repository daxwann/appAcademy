/*Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of the first n prime numbers. Hint: use isPrime as a helper method.*/

const isPrime = (num) => {
  if (num == 0 || num == 1) return false;
  if (num == 2) return true;
  if (num % 2 == 0) return false;

  for (let i = 3; i <= num / 2; i += 2) {
    if (num % i == 0) return false; 
  }

  return true;
};

const firstNPrimes = (n) => {
  let num = 2;
  let count = 0;
  const firstNPrimes = [];

  while (count < n) {
    if (isPrime(num)) {   
      firstNPrimes.push(num);
      count++;
      num++;
    } else {
      num++;
    }
  }

  return firstNPrimes;
}

console.log(`First 5 prime numbers: ${firstNPrimes(5)}`); // [2, 3, 5, 7, 11]

const sumOfNPrimes = (n) => {
  let sum = firstNPrimes(n).reduce((sum, primeNum) => {
    return sum + primeNum;
  }, 0);

  return sum;
}

console.log(`Sum of first 0 primes: ${sumOfNPrimes(0)}`); // 0
console.log(`Sum of first 1 primes: ${sumOfNPrimes(1)}`); // 2
console.log(`Sum of first 4 primes: ${sumOfNPrimes(4)}`); // 17
console.log(`Sum of first 5 primes: ${sumOfNPrimes(5)}`); // 28
