# Loops

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to use loops

## Introduction

JavaScript has the same basic kinds of loops than in other languages, such as `while` and
`for`:

```js
// For all numbers from 0 to 10
for (let i = 0 ; i <= 10 ; i++) {
  console.log(i);
}

// A 'while' loop doing the same thing
let i = 0

while (i <= 10) {
  console.log(i);

  i += 1;
} 
```

## Exercise

Use a `for` loop to iterate numbers from 1 to 20, and for each of them, print whether the
number is even or odd.

You should get the following output:

```js
1 is odd
2 is even
3 is odd
(...)
```

[Example solution](https://youtu.be/pT9kAUK_kmY?t=409)

## Challenge

This challenge builds on the previous one, where you defined a `fizzBuzz` function.

Write a function `fizzbuzzUntil` that accepts a number. This function should use a loop to
loop through all numbers from 1 to the given one, call the `fizzBuzz` function for the
current number and print the result.

You should get the following output:

```js
// In node

const fizzbuzzUntil = require('./fizzbuzzUntil');

fizzbuzzUntil(10);

1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
```

[Next Challenge](07_functions_as_values.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F06_loops.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F06_loops.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F06_loops.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F06_loops.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F06_loops.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
