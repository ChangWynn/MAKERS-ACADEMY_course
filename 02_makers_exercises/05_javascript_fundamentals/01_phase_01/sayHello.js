// const sayHello = name => {
//   console.log(`Hello ${name}`);
// };

// module.exports = sayHello;

const names = ['Anna', 'Li', 'Charlie', 'Mary', 'Jo'];

const isShorterThanThree = (name) => {
  if (name.length === 4) {
    return true;
  } else {
    return false;
  }
}

const namesShorterThanThreeLetters = names.filter((name) => {
  if (name.length === 4) {
    return true;
  } else {
    return false;
  }
});

