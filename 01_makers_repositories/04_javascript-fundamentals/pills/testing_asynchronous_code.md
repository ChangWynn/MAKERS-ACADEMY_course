# Testing Asynchronous Code
When we get into the world of asynchronous code, we need to be very careful
about how we test. This is because asynchronous code _takes time_, and so we
need a way to tell Jest not to finish running our test before it is complete.

This is important, because if Jest "completes" a test without any errors being
thrown, it counts it as passing, even if the `expect` then fails a moment
later!

There are a number of ways we can do this, and which one we use depends on
whether we are using promises or async/await to handle our async behaviour,
and also on whether we are mocking our requests.
<!--

## Testing Callbacks
In our Jest tests, we use Jest's `it` function, and pass a label for our test,
as well as a callback function containing the test code. Jest will execute this
callback when running our test.

What you might not realise, is that this callback is actually passed an 
argument by Jest, which is commonly called `done`. This argument is a function 
we can use to tell Jest when our test is complete. If the test we write takes
this `done` function as a parameter, Jest will wait until it is called before
completing the test.

```js
describe('Pokedex', () => {
  it('Can fetch the data for Pikachu', (done) => {
    const pokedex = new Pokedex();
    pokedex.getByNumber(25, (pokemon) => {
      expect(pokemon.name).toEqual('pikachu');
      done();
    });
  });
});
```

If we _don't_ include the `done` parameter, Jest will move on as soon as it gets
to the bottom of the test, _before_ the API call has completed and _before_ our callback
containing the `expect` calls has executed. Disaster!
-->

## Testing Promises
In our Jest tests, we use Jest's `it` function, which takes two arguments. The
first is a label for our test, and the second is a function containing the test
code itself. Jest will execute this
function when running our test.

What you might not realise, is that this callback is actually passed an 
argument by Jest, which is commonly called `done`. This argument is a function 
we can use to tell Jest when our test is complete. If the test we write takes
this `done` function as a parameter, Jest will wait until it is called before
completing the test.

```js
describe('Pokedex', () => {
  it('Can fetch the data for Jigglypuff', (done) => {
    const pokedex = new Pokedex();
    pokedex.getByNumber(39)
      .then((pokemon) => {
        expect(pokemon.name).toEqual('pikachu');
        done();
      });
  });
});
```
If we _don't_ include the `done` parameter, Jest will move on as soon as it gets
to the bottom of the test, _before_ the API call has completed and _before_ our callback
containing the `expect` calls has executed. Disaster!


Alternatively, if our test _returns_ a promise, Jest will wait for that promise
to settle before ending the test, without having to use `done`:

```js
describe('Pokedex', () => {
  it('Can fetch the data for Jigglypuff', () => {
    const pokedex = new Pokedex();
    return pokedex.getByNumber(39)
      .then((pokemon) => {
        expect(pokemon.name).toEqual('pikachu');
      });
  });
});
```

## Testing Promises with async/await
Async/await is Javascript [syntactic sugar](https://en.wikipedia.org/wiki/Syntactic_sugar)
which hides the usage of `.then` behind an `await` keyword. It makes
asynchronous code look more like synchronous code, but it is important to
remember that behind the scenes it is using `.then`, and so needs to be
treated differently from synchronous code.

For testing, this can be very useful, because async functions _always_ return
a Promise. Therefore Jest will wait until this Promise has settled (i.e. we
have got to the bottom of the function) before completing the test.

```js
describe('Pokedex', () => {
  it('Can fetch the data for Jigglypuff', async () => {
    const pokedex = new Pokedex();
    const pokemon = await pokedex.getByNumber(4)
    expect(pokemon.name).toEqual('charmander');
  });
});
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Ftesting_asynchronous_code.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Ftesting_asynchronous_code.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Ftesting_asynchronous_code.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Ftesting_asynchronous_code.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Ftesting_asynchronous_code.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
