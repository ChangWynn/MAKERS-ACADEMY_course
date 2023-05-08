// console.log doesn't print anything on the page
// it is not meant to be visible to the user, but for you
// to help in debugging and getting visibility in your JS code.
//
// on Mac (using Chrome), use Option+Command+J to open the console and see this message.

const { add } = require('./add')
const { multiply } = require('./multiply')


console.log('Hello from the developer console!');
console.log(new Date());
console.log(Object.keys(console))
console.log(Object.getOwnPropertyNames(Number(1987)))


console.log(multiply(add(2,2), 6))
