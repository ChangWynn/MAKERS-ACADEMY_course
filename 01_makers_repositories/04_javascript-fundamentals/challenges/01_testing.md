# Testing in JavaScript

## Objectives

 * Initialise a new project directory with `npm init`.
 * Write and run unit tests with Jest. 

Like in other languages, we have to test our programs to make sure they're working. In
this module we'll use the [library Jest](https://jestjs.io/) to write and run tests — like
we used RSpec when working with Ruby.

## Setting up

[Follow this guidance to setup a new project with NPM and
Jest.](../pills/setting_up_project.md)

## Exercise

You will test-drive a function called `add` which will take two numbers calculate their
sum.

First, let's create one file called `add.test.js` (the part `.test` is a naming convention
so Jest can find out in which files are the tests).

```
$ touch add.test.js
```

Below is the basic scaffolding for a test suite, using the `describe` function:

```javascript
// file: add.test.js

describe('add', () => {
  // test cases
});
```

As usual when writing tests, we need to think *what is it* we want to test or verify.
Let's imagine for a second that the function `add` exists, and that we can call it inside
the REPL. How could we test that this function is working? We could simply call it with
some given arguments and verify the result is correct:

```javascript
add(2, 2); // given we call `add` with 2 and 2, it should return 4
```

We can then translate this into a proper test case, using the `it` function:

```javascript
// file: add.test.js

describe('add', () => {
  it('adds 2 and 2', () => {
    // TODO: write test
  });
});
```

To complete the rest of this exercise, you will need to:
  * use [Jest test matchers](https://jestjs.io/docs/using-matchers) (such as
    `expect().toBe()`)
  * use `module.exports` and `require` to require a JavaScript "module".

### Questions

1. We've come up above with the basic scaffolding, using `it` to define the test case -
   fill in the blanks (the inside of this test case), using Jest matchers to write a test.
   You'll need to [use the Jest syntax](https://jestjs.io/docs/expect#tobevalue) to do
   this.
2. Write a second test case (a second `it` "block") testing with different numbers —
   perhaps adding 0 and 5.
3. Implement the function `add` into its file `add.js` so it satisfies the tests you just
   wrote. Make sure you've required the function from its file, and imported it in the
   test file.

<details>
<summary>Reveal suggested solution</summary>

1. Contents of `add.js`:
```javascript
const add = (a, b) => {
  return a + b;
}

module.exports = add;
```

2. Contents of `add.test.js`:
```javascript
const add = require('./add');

describe('add', () => {
  it('adds 2 and 2', () => {
    expect(add(2, 2)).toBe(4);
  });
});
```
</details>

## Exercise

Using the same process, test-drive the function `multiply` that calculates the product of
two numbers.

## Challenge

You will write tests for the `fizzBuzz` function you've defined earlier — name the file
containing the tests `fizzbuzz.test.js`.

To complete this exercise, you'll need to: 
  * Initialise a new project directory.
  * Use Jest's `describe` and `it` syntax.
  * Use Jest matchers to test the different cases above.
  * Use `module.exports` and `require` to import the `fizzBuzz` function in the test file.

Here's our acceptance criteria for this function:

```js
> fizzBuzz(3); 
'Fizz'

> fizzBuzz(5);
'Buzz'

> fizzBuzz(8);
8

> fizzBuzz(15);
'FizzBuzz'

> fizzBuzz(18);
'Fizz'

> fizzBuzz(20);
'Buzz'
```

1. Initialise a new project directory and install Jest.
2. In a file `fizzbuzz.test.js`, Write one test case for each acceptance criteria above,
   using one `it` block for each, and matchers to test the function's return value.
3. Write the `fizzBuzz` function in the file `fizzbuzz.js` to the four tests pass.


[Next Challenge](02_search_function.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F01_testing.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F01_testing.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F01_testing.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F01_testing.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F01_testing.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
