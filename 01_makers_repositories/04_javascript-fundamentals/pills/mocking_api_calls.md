# Mocking API Calls
This guidance will help you learn how to
 * Explain why we should mock HTTP requests made by our program
 * Mock HTTP requests sent using `fetch`
 * Use dependency injection to decouple JavaScript classes

When writing tests for our code, we always want to know that our tests are
testing what they say they are. If our internet connection falters, or the API
is down for a moment, the tests for _our code_ shouldn't start failing, because
there is nothing wrong with our code!

As a result, when we are writing unit tests or feature tests, it's important to
make sure that API calls to external services are mocked.

There are two main ways of doing this, and which one we use mainly depends on
whether we are writing a unit test or a feature test.

## Feature tests - using jest-fetch-mock
The library [Jest Fetch Mock](https://github.com/jefflau/jest-fetch-mock)
provides us with a way of intercepting usages of the built-in `fetch` function.

This is useful for feature tests, where we want to test multiple parts of our
code working together, but still want to insulate the test from random external
failures.

We can use it like this:
```js
const jestFetchMock = require("jest-fetch-mock");
jestFetchMock.enableMocks();

const apiRequest = require("./api");

describe("testing api", () => {
  beforeEach(() => {
    fetch.resetMocks();
  });

  it("calls google and returns data to me", (done) => {
    // This will intercept the next call to fetch, responding with some JSON.
    fetch.mockResponseOnce(JSON.stringify({ website: "Google" }));

    apiRequest("google").then((data) => {
      //assert on the response
      expect(data.website).toEqual("Google");

      //assert on the times called and arguments given to fetch
      expect(fetch.mock.calls.length).toEqual(1);
      expect(fetch.mock.calls[0][0]).toEqual("https://google.com");
      done();
    });
  });
});
```

## Unit Tests - Dependency Injection
Dependency injection is a method of decoupling classes, by removing a hard
dependency between different parts of a class system. For example, say we had
a Client class which was responsible for performing our API requests:

```js
class Client {
  getUser(id) {
    return fetch(`http://localhost:3000/users/${id}`)
      .then((response) => response.json())
  }
}
```

Say we wanted to create an `AddressBook` class, which would rely on the `Client`
class, and store returned users into an array. We could use Dependency
Injection to remove the hard dependency, and make our `AddressBook` class more
flexible.

```js
class AddressBook {
  constructor(client) {
    this.client = client
    this.users = []
  }

  addUserById = (id) => {
    return this.client.getUser(id)
      .then((user) => this.users.push(user))
  }

  all = () => {
    return this.users
  }
}
```

Now our `AddressBook` can be used with _any_ client, as long as the client
implements a method called `getUser`. This is good for our code flexibility,
but it's also excellent for testing, because suddenly we don't need to use a
real client at all!

In this example, we're using a jest mock function, which we can configure to
return anything we want.

```js
describe("AddressBook", () => {
  it("Adds a user from the client", (done) => {
    const mockClient = {
      getUser: jest.fn(), // This is a jest mock function
    };

    // Set the resolved value of the mock function.
    // We use `mockResolvedValue` and not `mockReturnValue` because this
    // is mocking an asynchronous method, which returns a promise.
    mockClient.getUser.mockResolvedValueOnce({
      name: "Makers",
      number: "020 3817 8870",
    });

    const addressBook = new AddressBook(mockClient);
    addressBook.addUserById(44).then(() => {
      expect(mockClient.getUser).toHaveBeenCalledWith(44);
      const contacts = addressBook.all();
      expect(contacts[0].name).toEqual("Makers");
      done();
    });
  });
});
```



<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_api_calls.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_api_calls.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_api_calls.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_api_calls.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fmocking_api_calls.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
