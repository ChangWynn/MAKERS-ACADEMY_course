# Test-driving the shopping basket

## Objectives

 * Test-drive a program made of different classes.
 * Mock a class in unit tests.

You will now test-drive and implement the two classes `Candy` and `ShoppingBasket` so the
following code works:

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

To complete this exercise, you'll have to:
  * Initialise a new project directory.
  * Write Jest tests cases for a class.
  * Declare a class and its methods.
  * Use a JS object as a "double" or mock.
  * [Use `let` rather than
    `const`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let)
    to make a variable able to change.

## About mocking

Remember that in JavaScript, we can create an object "on the fly" which has some methods —
similar to how doubles work in RSpec, for example.

If what we want from a mock is only to get a predictable return value from a method, then
a simple JS  object can also act as a double or mock for something else — let's say, as an
example, that we want to mock the native `String` class:

```js
const name = "James"; // a string
name.toLowerCase(); // 'james'

// let's now mock .toLowerCase()
// the following object has one property .toLowerCase,
// which is a function that returns the mocked value

const nameDouble = { toLowerCase: () => 'james' };

// so we can call nameDouble.toLowerCase()
// which means it's a drop-in replacement for "real" String object,
// *as long as we only want* to use .toLowerCase() on it.
```

If you'd like to know more about mocking, you may want to read the [guidance on mocking
with Jest](../pills/mocking_with_jest.md) — although the guidance above should be enough
for this exercise.

## Challenge

1. Setup the project directory and install Jest.
2. Test-drive and implement the `Candy` class (test file should be `candy.test.js`).
3. Test-drive and implement the `ShoppingBasket` class (test file should be
   `shoppingBasket.test.js`).
4. Our class `ShoppingBasket` depends on the `Candy` class (because it calls a method or
   property from this class). We need to properly isolate it in our unit tests — use a JS
   object as a "mock" as explained above.

## Exercise - debugging

Later, you're working to add a method `applyDiscount` to the class `ShoppingBasket` to
apply a discount of a certain amount to the total price of the basket. However, something
doesn't work — can you find the bug? (some of the code has been omitted for clarity)

```javascript
class ShoppingBasket {
  constructor() {
    this.discount = 0;
  }

  applyDiscount(discount) {
    discount = this.discount;
  }

  getTotalPrice() {
    let totalPrice = 0;
    this.candies.forEach((candy) => {
      totalPrice += candy.getPrice();
    });

    return totalPrice - this.discount;
  }
}
```

## Additional resources

 * [Mocking with Jest](../pills/mocking_with_jest.md)

[Next Challenge](04_thermostat.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F03_shopping_basket.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F03_shopping_basket.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F03_shopping_basket.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F03_shopping_basket.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F03_shopping_basket.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
