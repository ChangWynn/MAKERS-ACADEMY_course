// EXERCISE 1

const checkLength = (phoneNumber) => {
  return phoneNumber.length <= 10
}

const filterLongNumbers = (phoneNumberArray) => {
  return phoneNumberArray.filter((phoneNumber) => checkLength(phoneNumber))
} 

const numbers = [
  '1763687364',
  '4763687363',
  '7867867862',
  'aaaaaaaabbbbbbbcccccdddddddd' // this element should be filtered
];

// console.log(filterLongNumbers(numbers))
// console.log(filterLongNumbers(['4763687363', '7867867862']))
// console.log(filterLongNumbers([]))

// EXERCISE 2
// const generateMessages = (namesArray) => {
//   return namesArray.map((name) => {
//     return `Hi ${name}! 50% off our best candies for you today!`;
//   });
// };

// const names = ['Anna', 'Laura', 'Josh', 'Min', 'Karla'];
// console.log(generateMessages(names))

//  CHALLENGE 
// const namesAndDiscounts = [
//   { name: 'Anna', discount: 50 },
//   { name: 'Laura', discount: 40 },
//   { name: 'Josh', discount: 30 },
//   { name: 'Min', discount: 50 },
//   { name: 'Karla', discount: 60 }
// ];




// const generateMessages = array => {
//   return array.map(object => {
//     return `Hi ${object["name"]}! ${object["discount"]}% off our best candies for you today!`;
//   });
// };

// console.log(generateMessages(namesAndDiscounts));

