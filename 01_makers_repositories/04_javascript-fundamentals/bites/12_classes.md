# Classes

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to declare and use classes.

<!-- OMITTED -->

## Introduction

Classes in JS work in a similar way to other languages, they are declared with *methods* —
and perhaps *attributes* — and can be instantiated when creating *instances*.

Here is how we can define a class:

```js
// file: rectangle.js

class Rectangle {

  // A constructor, to give initial arguments.
  constructor(height, width) {

    // We can define attributes stored on the instance with `this`
    this.height = height;
    this.width = width;
  }

  // A method.
  getArea() {
    return this.height * this.width;
  }
}

// Export the class
module.exports = Rectangle;
```

We can now launch the `node` REPL and require the class:

```js
// In the REPL

const Rectangle = require('./rectangle');
```

And use it to create new instances:

```js
const rect = new Rectangle(4, 10);

rect.getArea(); // 40
```

### Exporting classes

You might be wondering (rightly) what happens to our `module.exports` and `require`. We
know how to export functions, but what about classes?  Well, it turns out classes can be
exported and required the same way as functions! So we can write something like this:

```javascript
// In the rectangle.js file...
module.exports = Rectangle;
```

```javascript
// ... and in the node REPL
const Rectangle = require('./rectangle');

const rect = new Rectangle(4, 10);
```

## Exercise

We would like to implement a class to represent a user account. Here is how we should be
able to use this class:

```javascript
> const user = new User('Uma');

> user.getName(); 
'Uma'

> user.getIntroduction();
'Hi, my name is Uma'
```

To complete this exercise, you will have to:
 * Learn how to declare a class and its methods. Having a look at the [Classes MDN
   documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes#class_declarations)
   is a good start.
 * Initialise an attribute within the [constructor special
   method](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/constructor)


Implement the `User` class in a file `user.js` so it behaves exactly like in the example
code above.

Require the file into the `node` REPL to verify the class is working.

<details>
<summary>Reveal suggested solution</summary>

```javascript
// file: user.js

class User {
  constructor(name) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  getIntroduction() {
    return `Hi, my name is ${this.name}`;
  }
}
```

</details>

## Exercise

Given the following *array* of `User` instances (the class from the previous exercise):

```javascript
const users = [
  new User('Uma'),
  new User('Josh'),
  new User('Ollie')
];
```

We'd now like to have a class `UserBase` that behaves like this:

```javascript
> const userBase = new UserBase(users);

> userBase.count();
3

> userBase.getNames();
[ 'Uma', 'Josh', 'Ollie' ]

> userBase.getIntroductions();
[
  'Hi, my name is Uma',
  'Hi, my name is Josh',
  'Hi, my name is Ollie'
]
```

To complete this exercise, you will have to:
 * declare a new class and its methods.
 * use what you've previous learned on working with arrays, like the `map` method.
 * call methods from the `User` class.

Implement the `UserBase` class in a file `userBase.js` so it behaves exactly like in the
example code above.

Require the two classes into the `node` REPL to verify it's working.

## Challenge

Implement the classes `Candy` and `ShoppingBasket` so you can require them into `node` and
get the following behaviour:

```javascript
> const candy = new Candy('Mars', 4.99);

> candy.getName();
'Mars'
> candy.getPrice();
4.99

> const basket = new ShoppingBasket();
> basket.getTotalPrice();
0

> basket.addItem(candy);

> basket.getTotalPrice();
4.99

> basket.addItem(new Candy('Skittle', 3.99));
> basket.addItem(new Candy('Skittle', 3.99));

> basket.getTotalPrice();
12.97
```

## Additional resources

 * [Classes in JS](https://javascript.info/class)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F12_classes.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F12_classes.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F12_classes.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F12_classes.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F12_classes.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
