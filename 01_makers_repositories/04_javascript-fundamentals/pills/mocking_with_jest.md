# Mocking with Jest

In JavaScript, like in other languages, we sometimes want to mock different components (functions or objects) in our tests — we might do it for different reasons:
  * Get a predictable behaviour from a function that normally behaves randomly
  * Get a predictable behaviour from a function that normally depends on the "outside world" — an API network call, reading from a file...
  * Isolate the class or function under test from its dependencies in unit tests

If you're already familiar with another language and testing framework (e.g Ruby and RSpec), it can be interesting to compare and contrast the approaches you already know of (in that language) with the JavaScript approaches described on this page.

## Index
 * [How to mock an object using a "fake" or double value](#how-to-mock-an-object-using-a-"fake"-or-double-value)
 * [How to use Jest automatic mocks](#how-to-use-jest-automatic-mocks)
 * [How to verify a method has been called on a mock](#how-to-verify-a-method-has-been-called-on-an-object)

## How to mock an object using a "fake" or double value

Let's consider the two following JS classes:

```js
// Returns a random move from the array ['rock', 'paper', 'scissors']
class RandomGenerator {
  getMove() {
    const moves = ['rock', 'paper', 'scissors'];
    const randomIndex = Math.floor(Math.random() * moves.length);
    
    return moves[randomIndex];
  }
}

// Gets a player move as input and computes the result
// after comparing with the random move
class RockPaperScissors {
  constructor(randomGenerator) {
    this.randomGenerator = randomGenerator;
  }

  getResult(playerMove) {
    const randomMove = this.randomGenerator.getMove();
    
    const result = // here compute the result (omitted for brevity)

    return result;
  }
}
```

When writing unit tests for the `RockPaperScissors` class — which is dependent on the `randomGenerator` object —, we'll want to mock the behaviour of `randomGenerator` so we get a predictable "random" move, so we can choose the expected outcome of the game.

Ideally, we'd like to be able to do something like this:
```js
it('wins the game', () => {
  const randomGenerator = // some fake random generator that always returns 'paper'
  const game = new RockPaperScissors(randomGenerator);

  expect(game.getResult('scissors')).toBe('win');
});
```

In JavaScript, objects don't always have to be created from classes — they can be declared with the `{}` syntax (called [object literal syntax, or initializer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#syntax)). So we can do something like this:
```js
it('wins the game', () => {
  // an object with a property .getMove, which is a function
  const fakeRandomGenerator = {
    getMove: () => 'paper'
  }

  fakeRandomGenerator.getMove; // [Function: getMove]
  fakeRandomGenerator.getMove(); // 'paper'

  const game = new RockPaperScissors(fakeRandomGenerator);

  expect(game.getResult('scissors')).toBe('win');
});
```

## How to use Jest automatic mocks

The previous approach works fine for simple use cases, but can be a bit limited. We can also leverage [Jest automatic mocks](https://jestjs.io/docs/es6-class-mocks#automatic-mock) in order to mock the behaviour of a method. Here's an alternative approach for the previous use case, this time using a Jest mock:

```js
const RockPaperScissors = require('./rockPaperScissors');
const RandomGenerator = require('./randomGenerator');

jest.mock('./randomGenerator');

describe('RockPaperScissors', () => {
  beforeEach(() => {
    // Before each test, reset the mock
    // This helps starting each test case
    // with a "fresh" mocked class
    RandomGenerator.mockClear();
  });

  it('wins the game', () => {
    // 1. We use the normal constructor - Jest will take care of creating a mock.
    const mockRandomGenerator = new RandomGenerator();

    // 2. We mock the method getMove, replacing its normal implementation
    // with a custom function (which here simply returns 'paper').
    mockRandomGenerator.getMove.mockImplementation(() => 'paper');

    // 3. The rest is the same as when using the previous technique.
    const game = new RockPaperScissors(mockRandomGenerator);
  
    expect(game.getResult('scissors')).toBe('win');
  });
});
```

This approach requires a bit more boilerplate code, but gives us more flexibility on our mocks behaviour — we can also verify that the method `getMove` has been correctly called (see below).

## How to verify a method has been called on an object

Make sure you read the previous section before going through this one.

Sometimes, we might also want to verify that the interaction between two classes (a method calling a method from another object) works correctly. We can use Jest mocks to verify that a method has been called on a mock. Building on the previous example, we can verify that the instance of `RockPaperScissors` calls the method `getMove` on the "mock" random generator:

```js
it('calls getMove() once', () => {
  const mockRandomGenerator = new RandomGenerator();
  
  const game = new RockPaperScissors(mockRandomGenerator);

  // We don't need the result value
  _result = game.getResult('scissors');

  // We assert getMove() was called once
  expect(mockRandomGenerator.getMove).toHaveBeenCalledTimes(1);
});
```

## Additional resources

* [Class mocks in Jest](https://jestjs.io/docs/es6-class-mocks)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_with_jest.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_with_jest.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_with_jest.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_with_jest.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_with_jest.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
