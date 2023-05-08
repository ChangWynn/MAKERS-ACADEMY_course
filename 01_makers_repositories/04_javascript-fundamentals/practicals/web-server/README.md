# Building a web server using Node and Express

## Learning objectives

  * Build a small express application that responds to HTTP requests
  * Use `curl` to test the express application HTTP endpoints

## Introduction

[Express](https://expressjs.com/) is a lightweight framework that allows us to build web servers using Node (in a similar way to Ruby with Sinatra, for example). Express can be used in an NPM project and can be installed with:

```
npm add express
```

The simplest express application code looks like this:

```js
// index.js

const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
```

When executed with `node index.js`, this app does two things:
  * It immediately runs the server on the port 3000.
  * It declares a *route* for the `GET` HTTP method on the path `/`. The function passed in *callback* to this route is executed when a client sends a request to this route.

You can use the command line tool `curl` to request the app endpoint and get the message "Hello World!":

```
$ curl -XGET http://localhost:3000

Hello, World!
```

## Exercise 1 - a message

Build a small express application that keeps in memory a "message" which is a string value — initially, this message is an empty string. The application, when running, should answer to the following HTTP requests:
  * `POST /message` — sets the value of the message, using JSON data
  * `GET /message` — gets the current value of the message returned inside JSON data

To complete this exercise, you'll need to:
  * Declare [express routes](https://expressjs.com/en/guide/routing.html)
  * Use the [`express.json()` middleware](https://masteringjs.io/tutorials/express/body) to read JSON request data 

You can use `curl` with the following commands to check the expected result (assuming your app is running on the port 3000):

```
$ curl -XGET http://localhost:3000/message 
{ "message": "" }


$ curl -XPOST http://localhost:3000/message -H 'content-type: application/json' -d '{ "message": "Hello, Makers" }'


$ curl -XGET http://localhost:3000/message 
{ "message": "Hello, Makers" }

$ curl -XPOST http://localhost:3000/message -H 'content-type: application/json' -d '{ "message": "Good bye!" }'

$ curl -XGET http://localhost:3000/message 
{ "message": "Good bye!" }
```

## Exercise 2 - a counter

Build a small express application that keeps in memory a counter which starts at 0. The application, when running, should answer to the following HTTP requests:
  * `POST /counter` — increment the counter by 1.
  * `GET /counter` — gets the value of the counter
  * `DELETE /counter` — resets the value of the counter to 0.

You can use `curl` with the following commands to check the expected result (assuming your app is running on the port 3000):

```
$ curl -XGET http://localhost:3000/counter 
{ "counter": 0 }

$ curl -XPOST http://localhost:3000/counter 
$ curl -XPOST http://localhost:3000/counter 

$ curl -XGET http://localhost:3000/counter 
{ "counter": 2 }

$ curl -XDELETE http://localhost:3000/counter 

$ curl -XGET http://localhost:3000/counter 
{ "counter": 0 }
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fweb-server%2FREADME.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fweb-server%2FREADME.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fweb-server%2FREADME.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fweb-server%2FREADME.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=practicals%2Fweb-server%2FREADME.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
