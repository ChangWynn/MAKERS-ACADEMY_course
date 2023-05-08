# A candy search function

## Objectives

 * Test-drive a complex function.


We're being given the following array:
```javascript
const candies = [
  { name: 'Aero', price: 1.99 },
  { name: 'Skitties', price: 2.99 },
  { name: 'Mars', price: 1.49 },
  { name: 'Maltesers', price: 3.49 },
  { name: 'Skittles', price: 1.49 },
  { name: 'Starburst', price: 5.99 },
  { name: 'Ricola', price: 1.99 },
  { name: 'Polkagris', price: 5.99 },
  { name: 'Pastila', price: 4.99 },
  { name: 'Mentos', price: 8.99 },
  { name: 'Raffaello', price: 7.99 },
  { name: 'Gummi bears', price: 10.99 },
  { name: 'Fraise Tagada', price: 5.99 }
];
```

You can notice the shape is similar to what you've worked with before — an array of
objects, each object having two properties `name` and `price`.

To complete this question, you will some things you've learned previously:
  * The `filter` and `map` methods.
  * How to access an object property.
  * You'll also need to find out how to verify whether a string is the prefix for another
    string.
  * Use the `toEqual()` Jest matcher.

You'll test-drive a function `searchCandies` that takes the following two arguments: a
search string and a maximum price — and returns only the *names* of candies matching these
criteria:
  * the candy name *starts by* the search string
  * the candy price is less than the maximum price

We want the function `searchCandies` to behave like this:

```javascript
> searchCandies('Ma', 10);
[ 'Mars', 'Maltesers' ]

> searchCandies('Ma', 2); // Maltesers excluded: it's more than 2
[ 'Mars' ]

> searchCandies('S', 10); 
[ 'Skitties', 'Skittles', 'Starburst' ]

> searchCandies('S', 4); 
[ 'Skitties', 'Skittles' ] // Starbust excluded: it's more than 4
```

### Questions

1. Write tests for this function in a file `searchCandies.test.js`. There should be at
   least 4 tests to reflect the different examples above.
2. Implement the function `searchCandies` and make sure your tests pass.
3. Add one test to verify that the search prefix works when given in lowercase too:
```javascript
> searchCandies('ma', 10);
[ 'Mars', 'Maltesers' ]
```

4. Implement that new change and make sure the tests pass.

<!-- OMITTED -->

## Additional resources

 * [Chaining array methods in
   JS](https://www.geeksforgeeks.org/chaining-of-array-methods-in-javascript/)

[Next Challenge](03_shopping_basket.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F02_search_function.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F02_search_function.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F02_search_function.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F02_search_function.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F02_search_function.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
