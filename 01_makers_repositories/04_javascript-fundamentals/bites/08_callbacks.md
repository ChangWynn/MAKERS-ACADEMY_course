# Callbacks

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to explain and use callback functions.

## Asynchronous Programming

Before moving on to callbacks, we need to say a few words about the two different kind of tasks that a program can run:
 * **Immediate tasks** - almost everything you've done so far belongs in this category. It can include printing some output, calculating a mathematical result, running a loop, etc. It takes no time (no perceivable time, at least) for it to complete on most computers and devices.
 * **Tasks taking time** - this is anything that can take time. For example, sending an HTTP request and waiting for a response takes time. Querying a database takes time. Generally, anything involving a request to another software or server, or anything going through the network, can take time. Also, running a timer is a straightforward example of something taking time.

![](../resources/immediate-and-long-tasks.png)

The picture above illustrates the difference. When a program starts, it usually performs a list of "immediate" tasks. As soon as a long task (think: "a task which takes time") needs to be performed, the program would have to wait or "block" for this task to complete.

JavaScript allows us to avoid blocking programs by using different mechanisms to deal with long tasks. The first one you'll learn about is **callbacks**.

## Video

[This demonstration video will help to understand the concept](https://youtu.be/KnB61fZjcv4?t=849). Stop this video before the exercise starts so you have the chance to try it yourself
first.

## On Callbacks

Callbacks are used a lot in JavaScript, so it's important to understand how they work. You'll see
later how they can be useful.

As the name imply, a callback is **a function**:

```js
const printMessage = () => {
  console.log('Hello there');
}
```

But we don't use the name "callback" for *any* function. Usually, we can say a function is
used as "callback" when it's given to another function, to be called later.

### An example?

Let's have a look at the native function `setTimeout` — it allows us to delay the
execution of some code after a certain time.

```js
const printMessage = () => {
  console.log('Hello there');
}

setTimeout(printMessage, 2000);
```

It gets two arguments:
 * the function to execute after the delay
 * the delay (in milliseconds, so in the previous example, 2 seconds)

Note that the following syntax is doing the exact same thing, using an anonymous function
(i.e a function not bound to a name) directly:

```js
// The function given is the same, but it's not
// assigned to a name before using the `const` keyword.

setTimeout(() => {
  console.log('Hello there');
}, 2000);
```

The function given in first argument to `setTimeout` is an example of a **callback** —
we've declared this function, but it won't be called until `setTimeout` decides to call it
(i.e after a delay, in the last example). The name "callback" comes from the fact that
this function's purpose is to be *called back* by another part of the code, at a later
time.

This is an example of **asynchronous programming** — the timer is a task which takes time to complete. To avoid blocking the entire program, we're giving a callback function to `setTimeout`, so it can be executed when the timer is lapsed. In the meantime, the rest of our program will continue to execute normally. That's why it's called asynchronous.

The code snippet below breaks down these different steps with calls to `console.log` - feel free to paste this into a JavaScript file to try running it yourself, and see the result.

```js
console.log('1. The program starts');

setTimeout(() => {
  console.log('4. The timer is lapsed, this callback function is now called');
}, 2000); // 2000ms = 2 seconds

console.log('2. The timer has started, and the callback function registered to be called later');

console.log('3. The rest of the program below (immediate tasks) will keep running immediately');
```

## Exercise

1. Declare a function `printHello` which prints a greeting message.
2. Use `setTimeout` to execute this function after a 3 seconds delay.

[Example solution](https://youtu.be/KnB61fZjcv4?t=1013)

## Exercise

To work on this exercise, it is important to think of functions as regular values (they can be passed around just like any other variable). 
[Revisit the previous section](./07_functions_as_values.md) if this wasn't clear.

Declare a function `executeAfterDelay` which calls the given function after the given
delay in seconds:

```js
const printHello = () => {
  console.log('Hello!');
}

executeAfterDelay(5, printHello);

// After about 5 seconds, you should see the message being logged

Hello!
```

[Example solution](https://youtu.be/KnB61fZjcv4?t=1058)

## Challenge

In this challenge you'll need to use the function `setInterval`. It works the same way as
`setTimeout`, but rather than executing the given function once after a delay, it executes
it repeatedly. For example, if we give `2000` for the number of milliseconds, the function
will execute every 2 seconds:

```js
setInterval(myFunction, 2000); // myFunction will execute every 2 seconds
```

In a new file `counter.js`:

 * Declare a variable `counter` initialised at the value 0 — this value will need to
   change, so use `let` rather than `const`.
 * Declare a function called `increment` that:
   * increments the value of `counter` by 1
   * and prints it using `console.log`
 * Using `setInterval`, call this function every second so the counter is incremented and
   printed every second.

If you've done the above correctly, you should be able to run the file and see the counter
being incremented and printed every second:

```
$ node counter.js
1
2
3
(...)
```

---


### Additional resources

 * [What is a callback? (video)](https://www.youtube.com/watch?v=xHneyv38Jro)

[Next Challenge](09_arrays.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F08_callbacks.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F08_callbacks.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F08_callbacks.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F08_callbacks.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F08_callbacks.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
