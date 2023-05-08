# Callback functions in JavaScript

## Learning objectives

 * Explain the asynchronous behaviour of using functions as callbacks in JavaScript
 * Use a function as callback to handle asynchronous actions

## Exercise 1 - a timer

To complete the following exercise, you'll have to:
 * Use the `setTimeout` function.

In a file `index.js`, define a function `printHello` that prints the message 'Hello' using `console.log`. Then, use the native `setTimeout` function to call `printHello` after 5 seconds. 

You'll know if your code works if you can run the file and — after 5 seconds — the message is printed to the console.

## Exercise 2 - a counter

To complete the following exercise, you'll have to:
 * Use the `setInterval` function.

In a file `index.js`, declare a variable `counter` initialised to 0, and a function `incrementCounter` that... increments that counter value by 1. Then, use the native `setInterval` function to call `incrementCounter` every second.

When running the program, the counter should be at 5 after about 5 seconds, at 10 after about 10 seconds, etc. You can use `console.log` inside the function given to `setInterval` to verify that your code is working.

## Exercise 3 - returning a value

***Troubleshooting**: If the cats API used in the exercise below is not working or responding, you can use this Github API endpoint to get the list of repos from the Makers organisation: https://api.github.com/orgs/makersacademy/repos*

To complete the following exercise, you'll have to:
 * Use the `got` NPM package

In this exercise, we'll use the `got` library which allows to send HTTP requests. It can be installed in your project directory using `npm install got`. Here's a basic example on sending a request using it:

```js
const got = require('got');

got('https://api.github.com/repos/sinatra/sinatra').then((response) => {
  console.log(response);
});
```

1. Write the above example to a new file in your project directory, and add at least three `console.log` to print numbers to the terminal instead of the `__`, depending on the order you think the different steps happen.
```js
const got = require('got');

console.log(__);

got('https://api.github.com/repos/sinatra/sinatra').then((response) => {
  console.log(__)
  console.log(response);
});

console.log(__)
```
2. Verify your assumptions by running the code and checking the order in which numbers are printed.
3. Declare a function `fetchCatFacts` that sends an HTTP request to the URL https://cat-fact.herokuapp.com/facts (it's an API that allows to get some random cat facts — interesting isn't it?). This function should print the response to the console when it is received.
4. We're now trying to get back the response from the function `fetchCatFacts`:

```js
response = fetchCatFacts();

console.log(response);
```

This is not working though. Modify the function `fetchCatFacts` so it accepts a function in argument, that will get called once the response is received. Once this is done, you should be able to call the function in this way:

```js
fetchCatFacts((response) => {
  console.log(response);
});
```

5. Make a diagram of the different steps that happen in this exercise. 

<details>
<summary>Reveal suggested solution for the `fetchCatFacts` function</summary>

```javascript
const got = require('got');

const fetchCatFacts = (callback) => {
  got('https://cat-fact.herokuapp.com/facts').then(response => {
    callback(response);
  });
}
```
</details>

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fcallbacks%2FREADME.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fcallbacks%2FREADME.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fcallbacks%2FREADME.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fcallbacks%2FREADME.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fcallbacks%2FREADME.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
