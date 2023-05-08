

const getNumberSign = (num) => {
  if (num < 0) {
    return "negative";
  }
  else if (num > 0) {
    return "positive";
  }
  else {
    return "zero";
  };
};

// console.log(getNumberSign(-5))

// EXERCISE 2
const isValidLength = (phoneNumber) => {
  const validLength = 11;
  return phoneNumber.length === validLength
}

// console.log(isValidLength('00'));
// console.log(isValidLength('00112233445'));

// CHALLENGE

const fizzbuzz = (num) => {
  if (num % 3 === 0 && num % 5 === 0) {
    return "Fizzbuzz";
  }
  else if (num % 5 === 0) {
    return "Buzz";
  } 
  else if (num % 3 === 0) {
    return "Fizz";
  }
  else {
    return num;
  };
};

console.log(fizzbuzz(3));
console.log(fizzbuzz(5));
console.log(fizzbuzz(8));
console.log(fizzbuzz(15));
console.log(fizzbuzz(18));
console.log(fizzbuzz(20));


