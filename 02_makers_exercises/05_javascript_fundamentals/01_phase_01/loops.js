// exercise

// for (let i = 1; i <= 20; i++) {
//   if (i % 2 === 0) { console.log(`${i} is even`) }
//   else if (i % 2 !== 0) { console.log(`${i} is odd`) };
// };

// challenge

const fizzBuzzUntil = (num) => {
  for (i = 0; i <= num; i++) {
    if (i % 3 === 0 && i % 5 === 0) { console.log("Fizzbuzz"); }
    else if (i % 5 === 0) { console.log("Buzz"); }
    else if (i % 3 === 0) { console.log("Fizz"); }
    else { console.log(i); };
  };
};

fizzBuzzUntil(20);



