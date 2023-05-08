# Functions

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to declare and call JavaScript functions.

## Introduction

In JavaScript, we can define a function with the "function literal syntax".
```js
() => {
  console.log('Hi there!');
};
```
If you ever see this syntax, with parentheses followed by that little arrow
`=>`, you are seeing a function being created. But how do we execute this 
function, after it's been defined? Currently this function is unnamed. It's
known as an _anonymous function_.

If we want to use it later, we need to give it a name by storing it in a variable:
```js
// 1. This function accepts no arguments
const printMessage = () => {
  console.log('Hi there!');
}

// 2. This function accepts one
const printMessage = (message) => {
  console.log(message);
}

printMessage('Hi there!');
```

**Note:** We use the `return` keyword to return a value from the function.
Be careful - in JavaScript, we *have* to use `return`, otherwise our function will return
`undefined`.

```js
const getName = () => {
  return 'Léo';
};

getName(); // returns 'Léo'

// 4. Here, we forgot to use `return`.
const getName = () => {
  'Léo'
};

getName(); // returns undefined
```

**Note:** In JavaScript, you **must** use parentheses `()` to execute a function,
even if it doesn't take any arguments. 

Take a look at the code below. What do you think `something` will be? Have a go
at running this code, and see if your intuition is correct by `console.log`ing `something`.

```js
const returnFour = () => {
  return 4;
};

const something = returnFour;
```

### Exporting a function

In JavaScript, to use a function outside of the file it is defined in, we need to "export"
it using `module.exports`:

```js
// file: hello.js

const hello = () => {
  console.log('Hello!');
};

// Add this at the end of the file
module.exports = hello;
```

Then we can "require" it from another file, or from the `node` REPL:

```js
// In the node REPL
// Assuming we're in the same current directory where hello.js is.

const hello = require('./hello');

hello();
```

## Demonstration

Stop this video before the exercise starts so you have the chance to try it yourself
first.

[Demonstration Video](https://youtu.be/l6UR1mK6dsg?t=334)

## Exercise

Define (in a file `sayHello.js`) the function `sayHello`, which returns the string
`'Hello'`.

Require and call that function in `node` - you should get the following result:

```javascript
> sayHello();
'Hello'
```

[Example solution](https://youtu.be/l6UR1mK6dsg?t=628)

### Debugging question

Your colleague is trying to call the function `sayHello` and print its result using
`console.log` — however, it doesn't work as expected: why? Make the fix so it prints the
return value of the function, as expected.

```javascript
console.log(sayHello);
```

## Exercise

Modify the previous function `sayHello` so it accepts one argument, and calling
`sayHello('Sarah')` displays a personalised message:
```javascript
> sayHello('Sarah');
'Hello Sarah'
```

Bonus: can you find another way to write the `sayHello` function, [without using the sign
`+` to concatenate the
strings?](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#string_interpolation)

```javascript
> sayHello();
'Hello'
```

[Example solution](https://youtu.be/l6UR1mK6dsg?t=675)

## Challenge

1. Define a function `add` (in a file `add.js`) which takes two arguments and return their
   sum.
2. Define a function `multiply` (in a file `multiply.js`) which takes two arguments and
   return their product.
3. From `node`, require and call the functions `add` and `multiply` to calculate and print
   the following: `2 * (4 + 4)`. You should get the correct result (16).

## A note about syntax

In this module, you'll learn "modern" JavaScript syntax — ES6 syntax or versions released
after 2015. Most JavaScript runtime (including Node) are compatible with older syntax
versions, and both syntax can be mixed in the same file. It's important to note that, when
searching online for resources and examples, you'll find some code using a different,
older, syntax. Here are two examples on declaring variables and functions:

 * `var` is the "legacy" keyword to declare a variable — it's equivalent to `let`:
    ```js
    var total = 120;
    
    // equivalent to
    let total = 120;
    ```
 * The `function` keyword can be used to declare functions:
    ```js
    function add(a, b) {
      return a + b;
    }

    // equivalent to
    const add = (a, b) => {
      return a + b;
    }

    // also equivalent to
    var add = function (a, b) {
      return a + b;
    }
    ```
  When writing code, prefer the syntax used in this module. But when reading code, online,
  remember those equivalences.

## Additional resources

 * [Defining
   functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions#defining_functions)

[Next Challenge](05_conditionals.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F04_functions.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F04_functions.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F04_functions.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F04_functions.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F04_functions.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
