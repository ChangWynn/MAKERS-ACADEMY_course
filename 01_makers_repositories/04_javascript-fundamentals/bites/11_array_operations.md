# Array operations

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to `filter` and `map` arrays.

## Introduction

You'll now learn about two methods we use on arrays:
  * [`filter`](https://www.w3schools.com/jsref/jsref_filter.asp) to create a new array by
    applying a predicate function on existing array's elements.
  * [`map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
    to create a new array by applying a specific operation to the existing array's
    elements.

```js
const names = ['Anna', 'Li', 'Charlie', 'Mary', 'Jo'];

// 1. Using a predicate function and `filter` to get only names shorter than 3 letters.
const isShorterThanThree = (name) => {
  if (name.length < 3) {
    return true;
  } else {
    return false;
  }
}

const namesShorterThanThreeLetters = names.filter(isShorterThanThree);

// 2. Create a new array of all names uppercased by applying
// the `getUppercased` function to all elements in the `names` array.

const getUppercased = (name) => {
  return name.toUpperCase();
}

const uppercasedNames = names.map(getUppercased);
```

## Exercise - phone numbers

Your friend now wants to launch a special promotion. They give you a long list of phone
numbers so you can create a small program to text everyone. You notice some lines in the
file are not phone numbers, but some corrupted data:

```
1763687364
4763687363
7867867862
AAAA#####AAAA#87@768767382672  <-- not a phone number!
4763687363
4763687363
(...)
```

However, you realise that most phone numbers on the list are no longer than 10 digits.
Maybe you could just implement a JavaScript function to do the filtering for you! 

To complete this exercise you will have to use Array's [filter
method](https://www.w3schools.com/jsref/jsref_filter.asp) to filter long numbers using
this function.

### Questions

1. Declare a function `checkLength` that takes a phone number (**as a string**) as
   argument, and returns `true` if this phone number contains **10 characters or less**.
2. Now declare a function `filterLongNumbers` that takes an array of phone numbers. This
   function should return only numbers that contain *10 characters or less*. It should
   make use of the function `checkLength` written previously.

Once your function is written, you should be able to type the following code and have the
exact same output:

```javascript
> const numbers = [
  '1763687364',
  '4763687363',
  '7867867862',
  'aaaaaaaabbbbbbbcccccdddddddd' // this element should be filtered
];

> filterLongNumbers(numbers);
[ '1763687364', '4763687363', '7867867862' ]

> filterLongNumbers(['4763687363', '7867867862']); // no number to filter out
[ '4763687363', '7867867862' ]

> filterLongNumbers([])
[ ]
```

[Example solution](https://youtu.be/BjRDUtiM5T8?t=559)

## Exercise - personalised messages

Your friend now would you like to also generate a personalised message for the SMS
promotion. Along with the phone numbers, you also now have a list of names:

```javascript
> const names = ['Anna', 'Laura', 'Josh', 'Min', 'Karla'];
```

To complete this exercise you'll have to:
 * create a function that takes a single name and generate the correct message for it.
 * use [Array's map
   method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
   to generate the list of personalised messages using this function.

### Questions

1. Write a function `generateMessages` that takes an array of names and returns an array
   of personalised messages for each name. For example, when given the array above, the
   function should return an array with the first element being the string `'Hi Anna! 50%
   off our best candies for you today!'`, the second element the string `'Hi Laura! 50%
   off our best candies for you today!'`, and so on. 

Once your function is written, you should be able to type the following code and have the
exact same output:
```javascript
> const names = ['Anna', 'Laura', 'Josh', 'Min', 'Karla'];

> generateMessages(names);
[
  'Hi Anna! 50% off our best candies for you today!',
  'Hi Laura! 50% off our best candies for you today!',
  'Hi Josh! 50% off our best candies for you today!',
  'Hi Min! 50% off our best candies for you today!',
  'Hi Karla! 50% off our best candies for you today!'
]
```

[Example solution](https://youtu.be/BjRDUtiM5T8?t=980)

## Challenge

Let's go back to our candy promotion texts. Your friend now wants to have a specific
discount percentage for each customer. After processing the list you're given, you end up
with the following array:

```javascript
// An array of objects!
> const namesAndDiscounts = [
  { name: 'Anna', discount: 50 },
  { name: 'Laura', discount: 40 },
  { name: 'Josh', discount: 30 },
  { name: 'Min', discount: 50 },
  { name: 'Karla', discount: 60 }
];
```

To complete this exercise, you'll have to:
  * use Array's `map` method again.
  * access the properties of an object as seen previously.

### Questions

1. Modify the function `generateMessages` so it uses this new structure and write the
   correct discount percentage in each message.

Once your function is written, you should be able to type the following code and have the
exact same output:
```javascript
> const namesAndDiscounts = [
  { name: 'Anna', discount: 50 },
  { name: 'Laura', discount: 40 },
  { name: 'Josh', discount: 30 },
  { name: 'Min', discount: 50 },
  { name: 'Karla', discount: 60 }
];

> generateMessages(namesAndDiscounts);
[
  'Hi Anna! 50% off our best candies for you today!',
  'Hi Laura! 40% off our best candies for you today!',
  'Hi Josh! 30% off our best candies for you today!',
  'Hi Min! 50% off our best candies for you today!',
  'Hi Karla! 60% off our best candies for you today!'
]
```

## Additional resources

 * [Filter array elements using `filter` and a test
   function](https://www.javascripttutorial.net/javascript-array-filter/)
 * [Use `map` to iterate through array items and create a new
   array](https://www.digitalocean.com/community/tutorials/4-uses-of-javascripts-arraymap-you-should-know)

[Next Challenge](12_classes.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F11_array_operations.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F11_array_operations.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F11_array_operations.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F11_array_operations.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F11_array_operations.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
