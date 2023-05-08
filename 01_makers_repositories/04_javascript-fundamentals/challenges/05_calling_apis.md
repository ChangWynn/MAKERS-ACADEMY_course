# Calling External APIs

## Objectives
- Explain that for a server, the API is the definition of
    - What HTTP requests the server responds to
    - How you can expect the server to respond to a HTTP request
- How we can use JavaScript's built-in `fetch` method to interact with APIs
- Write a class that utilises an external API

## Refresher - HTTP Requests
This rest of this module relies on having a good understanding of HTTP requests, what they are, what we use them for.
If you need a refresher on this topic, please take a look back at the [HTTP Bites from the Web Applications module](https://github.com/makersacademy/web-applications/blob/main/http_bites/01_intro_to_http.md).

## What is an API?
API stands for Application Programming Interface, and is essentially _how we interact with a program using code_. For a program running on an _external server_ however, the _only way_ we have to interact with it is through HTTP requests, sent over the internet.

As a result, **for applications running on a server, the API is the definition of _what HTTP requests_ the server will respond to, and _the format of the response_ it will send back**. Read this over a few times, it's really important!

As a result, the term "API" is commonly used to refer to any external server which can be interacted with, through HTTP requests. When we create these HTTP requests, we are "calling an API".

## Interacting with an API
Interacting with an API means sending a HTTP request to a server and receiving some response data. Github has an API which allows us to find out information about any Github repo we are interested in.

For example, one way of interacting with the Github API is to do a `GET` request to `https://api.github.com/repos/<user>/<reponame>`, where `<user>` and `<reponame>` are replaced with a github username and repo name respectively.

As we've seen before, we can use the command-line tool `curl` to perform get requests. For example, if we wanted to find out information about the repo for esbuild, we might enter into the terminal:
```sh
curl https://api.github.com/repos/evanw/esbuild
```

Have a go now. You should see a long list of data in [JSON format](https://developer.mozilla.org/en-US/docs/Glossary/JSON). JSON stands for JavaScript Object Notation, and is simply a way of writing a JavaScript object as a string.

Another method of easily performing GET requests is simply to visit the address in your browser. See what happens if you click this link: https://api.github.com/repos/evanw/esbuild

You've just used two methods of creating HTTP requests to interact with an API. But the real power behind APIs comes when we write code which can interact with them. We need to find a way to send HTTP requests directly from our code!

## Enter Fetch
`fetch` is a function built into JavaScript for creating HTTP requests. In its most basic form, we pass `fetch` a URL, and it will perform a GET request to that URL:

```js
fetch('https://api.github.com/repos/evanw/esbuild') // Sends a GET HTTP request to the Github API
```

We can also use it for creating HTTP requests with other methods, such as POST, but we'll cover that later on.

`fetch` is _asynchronous_, which means that it takes some time to complete. We don't want our program to freeze while the HTTP request completes, and so any code which relies on waiting for the data needs to be attached as a _callback_. 

(If you need a refresher on what asynchronous programming is, take a look back at the [Callbacks Bite](https://github.com/makersacademy/javascript-fundamentals/blob/main/bites/08_callbacks.md) from earlier in the module.)


`fetch` returns a Promise, which we can attach callbacks to using the `.then` method. Don't worry too much about Promises for now, just know that whenever you see `.then`, you're dealing with a Promise.

```js
fetch('https://api.github.com/repos/evanw/esbuild')
  .then((response) => response.json())
  .then((data) => console.log(data));

console.log('End of File');
```

What do you think you will see if you ran this code? Write down your prediction or discuss with your pair partner. Then try running the code. Is the result what you expected?

There's a lot going on here, so let's go through it step by step:
1. `fetch` sends a GET HTTP request to the github API.
2. Because HTTP requests _take time_, we have use a _callback_ to attach any functionality that we want to happen _after_ the request completes. We can do this using the `.then` method.
3. We pass our first callback, which will take the response to the HTTP request, and decode it from JSON into a JavaScript object, by calling `.json()`
4. We pass our second callback which will take the resulting data, and log it to the console.
5. We log "End of File" to the console.
6. The HTTP request completes, and our callbacks run, logging the data to the console.

## Challenge - Hitting the PokéApi
We're going to use the publicly available [Pokémon API](https://pokeapi.co/) to create a Pokédex app, where we can store a list of Pokémon we have caught, in our quest to be [the very best, like no one ever was](https://youtu.be/6xKWiCMKKJg).

- Create a file, `api.js` which exports a function `fetchPokemon`. This function should:
  - Take the name of a Pokémon as an argument
  - Use `fetch` to make a HTTP request to `https://pokeapi.co/api/v2/pokemon/<pokemonname>`
  - Once the fetch has completed, _then_ convert the response to JSON
  - Once the response is converted to JSON, _then_ log out the data.


[(Don't know what a Pokédex is?)](https://en.wikipedia.org/wiki/Gameplay_of_Pok%C3%A9mon#Pok%C3%A9dex)
```javascript
// in node

const fetchPokemon = require('./api.js')
fetchPokemon('pikachu')

// This should log:
// {
//   abilities: [
//     { ability: [Object], is_hidden: false, slot: 1 },
//     { ability: [Object], is_hidden: true, slot: 3 }
//   ],
//   base_experience: 112,
//   forms: [
//     {
//       name: 'pikachu',
//       url: 'https://pokeapi.co/api/v2/pokemon-form/25/'
//     }
//   ],
//   height: 4,
//   held_items: [
//     { item: [Object], version_details: [Array] },
//     { item: [Object], version_details: [Array] }
//   ],
//   id: 25,
//   (etc...)
// }
```

## Challenge - Finishing the Pokédex
Currently the API is returning a huge amount of data, most of which we don't care about. Let's keep only the info we want.

### 1. Update `fetchPokemon` 
Update `fetchPokemon` so that:
  - It returns a Promise
  - Instead of `console.log`ing the Pokémon data, we instead use it to create and return a new object, containing the following fields:
    - `name`, the name of the Pokémon
    - `id`, the id number of the Pokémon
    - `height`
    - `weight`
    - (Bonus) `types`, what types the Pokémon is. This should be an array, such as `['electric']` or `['fire', flying']`

```js
// in node

const fetchPokemon = require('./api')
fetchPokemon('charizard')
  .then((pokemon) => console.log(pokemon))

// This should log:
// {
//   name: 'charizard',
//   id: 6,
//   height: 17,
//   weight: 905,
//   types: ['fire', 'flying']
// }
```

<details>
<summary>Hint:</summary>

- `fetch` and `.then` both return Promises, so it should be a very small change to make sure that `fetchPokemon` is returning a Promise.
- `(response) => response.json()` is a shorthand for 
```js
(response) => {
  return response.json()
}
```
so if you want to use multiple lines of code in your callback, such as for creating a new JS object and giving it keys and values, then returning it, you will probably want to use the format with the `{}` braces.
</details>

### 2. Testing `fetchPokemon`
Create a test file for our `fetchPokemon` method.
  - You may want to refer to the [Testing Asynchronous Code pill](../pills/testing_asynchronous_code.md).
  - Make sure your code passes the test that you write.

<details>
<summary>Suggested solution</summary>

```js
// inside api.test.js
const fetchPokemon = require('./api')

describe('fetchPokemon', () => {
  it('returns a promise of the useful pokemon data', (done) => {
    fetchPokemon('charizard')
      .then((pokemon) => {
        expect(pokemon.id).toEqual(6);
        done();
      });
  });
});
```
</details>

### 3. Creating the Pokédex

Test-drive a `Pokedex` class, that has two methods, `catch` and `all`, with the following behaviour:

```js
// in the node REPL

const pokedex  = new Pokedex();
pokedex.catch('pikachu'); // Adds pikachu to the pokedex
// then, after some time has passed...
pokedex.catch('jigglypuff'); // Adds jigglypuff to the pokedex
// then, after some time has passed...
pokedex.all(); // returns an array of the pokemon in the pokedex
```

## Summary
_Phew!_ That was a lot! Let's recap. 

By now, you should know:
- What an API is.
- How we can interact with APIs, using the terminal, browser, and JavaScript.
- That some operations take time to complete, and are asynchronous.
- Some asynchronous operations, like `fetch`, return something called a Promise
- Promises have a `.then` method, which allows us to say what we want to do _once the operation has completed_, by passing a _callback_.
- Because asynchronous operations take time to complete, we need to write our tests slightly differently when using them.

If you're fuzzy on any of these points, reread the material in this section, or send a question to your cohort slack channel or coach.

## Additional resources
 * [Testing Asynchronous Code - Jest Docs](https://jestjs.io/docs/asynchronous)
 * [Testing Asynchronous Code - Pill](../pills/testing_asynchronous_code.md)
 * [MDN fetch docs](https://developer.mozilla.org/en-US/docs/Web/API/fetch)

[Next Challenge](06_weather_api.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F05_calling_apis.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F05_calling_apis.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F05_calling_apis.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F05_calling_apis.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F05_calling_apis.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
