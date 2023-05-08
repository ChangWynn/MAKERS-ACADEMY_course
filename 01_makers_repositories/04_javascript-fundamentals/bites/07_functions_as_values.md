# Functions as values

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to use functions as values, and as arguments for other functions.

<!-- OMITTED -->

## Introduction

In JavaScript, functions are values in their own right, like for other types — numbers,
strings, etc.

```js
// Creating a function
const aFunction = () => {
  return 123;
}

// Functions can be referenced as values, without the brackets ()
// here we are essentially assigning the exact same function to a new name.
const anotherFunction = aFunction;

// When using the brackets (), we're *calling* the function
// so we'll get the value returned by it.
const returnValue = anotherFunction();
```

This also mean we can pass a function to another one, as an argument. Let's see one
example:

```js
const uppercaseMessage = (message) => {
  return message.toUpperCase();
}

// This function accepts as arguments a string message, and a function.
// It then calls the given function to do its job.
const transform = (message, transformFunction) => {
  return transformFunction(message);
}

transform("hello", uppercaseMessage);
```

You're encouraged to run the above in `node` and play with it to get a good understanding
of how it works.

## Demonstration

Stop this video before the exercise starts so you have the chance to try it yourself
first.

[Demonstration Video](https://www.youtube.com/watch?v=KnB61fZjcv4)

## Exercise

1. Declare a function `lowercaseMessage` that returns [the lowercase
   version](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase)
   of the given string.

2. Declare a function `transform` that behaves like the one above:
    * takes one string and one function as arguments
    * calls the function on the given string.

3. Call `transform` by giving it the string `'WHY ARE YOU SHOUTING?'` and the function
   `lowercaseMessage`. It should return a lowercase version of the message (`'why are you
   shouting?'`)

[Example solution](https://youtu.be/KnB61fZjcv4?t=606)

## Challenge

You've previously learned how to declare a function, and you've also seen that a function
can be assigned just like a variable. To complete this exercise, you'll have to pass a
function *as an argument* to another function.

1. Declare a function `notifyByEmail` that accepts an email address as argument and
   returns the string `'Email sent to: <EMAIL>'`.
2. Declare a function `notifyByText` that accepts a phone number (as a string) as argument
   and returns the string `'Text sent to: <PHONE NUMBER>'`.
3. Now declare a generic function `notify` that accepts a first string argument (either an
   email or a phone), and *the function to use* in second argument. This function should
   only rely on calling the function passed in second argument, not declare a string by
   itself.
4. Use the function `notify` with the two previous functions to:
    * send an email to `hello@makers.tech.test` and get the expected output.
    * send a text to `+10000000000` and get the expected output.

<details>
<summary>Reveal suggested solution</summary>

```javascript
const notifyByEmail = (email) => {
  return `Email sent to: ${email}`;
}

const notifyByText = (phoneNumber) => {
  return `Text sent to: ${phoneNumber}`;
}

const notify = (emailOrPhone, notifyFunction) => {
  return notifyFunction(emailOrPhone);
}

console.log(notify('hello@makers.tech.test', notifyByEmail));
console.log(notify('+10000000000', notifyByText));
```
</details>



[Next Challenge](08_callbacks.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F07_functions_as_values.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F07_functions_as_values.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F07_functions_as_values.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F07_functions_as_values.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F07_functions_as_values.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
