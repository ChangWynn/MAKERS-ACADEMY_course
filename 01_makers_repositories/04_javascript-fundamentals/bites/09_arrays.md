# Arrays

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to use arrays.

## Introduction

In this section you'll learn about arrays. We'll look at how to perform basic operations
on arrays, but also more complex things that can be useful in our programs.

```js
const numbers = [1, 2, 3, 4];

const newNumbers = numbers.concat(5); // adds one element and return a new array

// We can access elements with []
console.log(numbers[0]); // 1

console.log(numbers); // [1, 2, 3, 4]

console.log(newNumbers) // [1, 2, 3, 4, 5]

console.log(numbers.length) // 4

console.log(newNumbers.length) // 5

// Loop through the array and execute code for each element
numbers.forEach((number) => {
  console.log(number);
})
```

## Exercise

Create an array of a few names of people you know and:

1. Print the array's length.
2. Print the second name of the array.
3. Create a new array by adding a new name to the existing array.

[Example solution](https://www.youtube.com/watch?v=BjRDUtiM5T8)

## Exercise

Create an array of all numbers from 1 to 10. Calculate the sum of all these numbers by
looping through the array.

You can use [the method
`forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
to iterate over each element.

[Example solution](https://youtu.be/BjRDUtiM5T8?t=167)

## Challenge

You are helping your friend, who owns a candies business, with their website. Every order
placed on the website gets assigned an order ID, such as `1274`.

Your friend would like to create batches of *five* order IDs. They ask you if you could
give a hand and write a small program to do this.

To complete this exercise you will have to find out:
 * how to [add elements to an array with the `.concat`
   method](https://www.samanthaming.com/tidbits/87-5-ways-to-append-item-to-array/)
 * how to get the length of an array

### Questions

1. Declare a function `addToBatch` that takes two arguments, an *array* and *a number*,
   and returns a *new array* by adding the number to the array.
2. Now, make sure this function *does not* add the number *if the array's length is
   already 5 or greater* — it should just return the array untouched in that case.

Once your function is written, you should be able to type the following code and have the
exact same output:

```javascript
> addToBatch([1], 3); 
[ 1, 3 ]

> addToBatch([1, 2, 3], 4); 
[ 1, 2, 3, 4 ]

> addToBatch([], 8); 
[ 8 ]

> addToBatch([1, 2, 3, 4, 5, 6], 7); 
[ 1, 2, 3, 4, 5, 6 ]

> addToBatch([1, 2, 3, 4, 5, 6, 7, 8, 9], 10); 
[ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
```

<details>
<summary>Reveal suggested solution</summary>

```javascript
const addToBatch = (array, number) => {
  if (array.length >= 5) {
    return array;
  }

  return array.concat(number);
}
```

</details>

## Additional resources

 * [Array's `concat`
   method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)

[Next Challenge](10_objects.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F09_arrays.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F09_arrays.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F09_arrays.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F09_arrays.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F09_arrays.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
