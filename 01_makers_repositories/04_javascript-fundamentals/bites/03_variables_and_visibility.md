# Variables and getting visibility

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to declare variables and print them in JavaScript.

<!-- OMITTED -->

## Introduction

In JavaScript, we can print **to the terminal** arbitrary strings and variables using
`console.log`, like this:
```javascript
// Just printing a literal string
console.log('Hello there');

// Declaring a new variable `age`
age = 25;

// We can concatenate strings with variables using the + operator
console.log('I am ' + age + 'years old');

// Assigning a new value
age = 27;
console.log('I am now ' + age + 'years old!');
```

We can use the `const` keyword to declare a value as "constant", if we're not planning to
change its value later — usually, **prefer using `const` if you don't need to reassign a
variable**, as it can prevent a few different kind of errors in your programs (it also
communicates that this value won't need to change).

```javascript
const name = 'Charlie';

name = 'Jess'; // will throw 'TypeError: Assignment to constant variable.'
```

## Demonstration

Stop this video before the exercise starts so you have the chance to try it yourself
first.

[Demonstration Video](https://www.youtube.com/watch?v=l6UR1mK6dsg)

## Exercise

1. In the `node` REPL, declare two variables — `a` with value 4 and `b` with value 6.
2. Using `console.log`, print the result of:
    * `a + b` (should print 10)
    * `a * b` (should print 24)

[Example solution](https://youtu.be/l6UR1mK6dsg?t=238)

## Challenge

Can you find the problem in the following program? Make the fix, so the code prints "Hello
Makers" when run into `node`.

```javascript
const greeting = 'Hello ';
const name = 'Makers';

console.log greeting + name;
```


[Next Challenge](04_functions.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F03_variables_and_visibility.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F03_variables_and_visibility.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F03_variables_and_visibility.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F03_variables_and_visibility.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F03_variables_and_visibility.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
