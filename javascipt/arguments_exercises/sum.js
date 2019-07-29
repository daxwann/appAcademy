// using arguments object
function sum1() {
  let sum = 0;
  const args = Array.from(arguments);

  args.forEach((num) => {
    sum += num;
  })

  return sum;
}

// using rest operator
function sum2(...nums) {
  let sum = 0;

  nums.forEach((num) => {
    sum += num;
  })

  return sum;
}

console.log(sum1(1, 2, 3));