# Objects

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to declare and use JavaScript objects.

## Introduction

Let's talk about objects, which are a different kind of data. In other languages, you
might have learned to think about objects as "instances of a class" - for example, in the
following Ruby code, `bike` would be an object (instance of the `Bike` class):

```ruby
bike = Bike.new
```

However, in JavaScript, "object" usually refers to a type of key-value structure, similar
to a Ruby hash. Here's an example of a JavaScript object:

```javascript
const person = {
  name: 'Maxine',
  age: 32,
  address: 'London, E1 123'
};

// both ways can be used to access an object's property:
console.log(person.name);
console.log(person['name']);

```

## Two ways of declaring objects

This can be somewhat confusing at first, but there are two ways of declaring objects in
JavaScript. The first one is described above, here's another example:

```js
const bankAccount = {
  // simple value attributes
  accountNumber: 376782676,
  accountSortCode: 999999,

  // we can attach functions too (so they act like 'methods'):
  getBalance: () => {
    return 100;
  }
};

bankAccount.getBalance();
```

This is useful as a key-value data structure (similar to hashes or maps in other
languages), or when you need a single, placeholder object (you'll see this later when
you'll need to mock in your unit tests).

The other way, which you're probably familiar with, is **to create objects from a class**
so they all have the same "blueprint" of attributes and methods. You'll learn about how to
create JavaScript classes soon. 

## Exercise

An object is composed of *key-values* pairs. Those values can be any primitive values such
as strings or numbers, as in the example above, or they can be more complex things, such
as other objects, arrays, or even functions:
```javascript
const person = {
  name: 'Maxine',
  age: 32,
  address: {
    city: 'London',
    postcode: 'E1 123'
  },
  hobbies: ['writing', 'tennis', 'cooking']
};
```

1. Print the value of the `city` attribute ('London').
2. Print the value of the second `hobbies` value ('tennis').

[Example solution](https://youtu.be/BjRDUtiM5T8?t=396)

## Challenge

1. Declare an object `cohort` that has the following properties:
    * a string `name` (e.g `'May2022'`)
    * a number `id` (e.g `1234`)
    * an array of student names

2. Declare a function that accepts that object as argument and print a message with the
   following structure:
```
<COHORT_ID> - <COHORT_NAME> - <NUMBER_OF_STUDENTS> students in this cohort
```

### Additional resources

 * [Objects and
   properties](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects#objects_and_properties)

[Next Challenge](11_array_operations.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F10_objects.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F10_objects.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F10_objects.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F10_objects.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F10_objects.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
