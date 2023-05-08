# A web server

## Objectives

 * Use express to serve a simple web app.
 * Use express routes to expose a JavaScript program.

This will be a stretch goal. So far the only way to interact with our thermostat is to
enter commands in a CLI. That's not very exciting, and you would definitely not expect
your users to do this! However, if we were to transform our thermostat program into a Web
API, we could then build a web application that people could use with their browser!

In order to do this, we'll need to have a look at a very popular package in the Node
community, called express. It is a very lightweight library to build web applications,
similar to Ruby's Sinatra that you might already know. 

## Exercise: a simple web server

Create a new project directory called `simple-server`, and install the `express` package:

```
$ npm add express
```

Then, create a file `server.js` inside this directory, with the following code:
```javascript
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello, express!')
});

console.log(`Server listening on localhost:${port}`);
app.listen(port);
```

1. Run this file using `node server.js` — it should output `Server listening on
   localhost:3000` to the terminal, once run. Head now with your browser to
   `http://localhost:3000` - what do you see?
2. Modify the message passed to `res.send()` and reload the page to see a different
   result.

## Exercise: adding routes

Note: in order to test out the following exercise, you can use [the `curl` utility
program](https://idratherbewriting.com/learnapidoc/docapis_install_curl.html#make-a-test-api-call)
from your terminal, rather than the browser. The option `-X` allow us to use a HTTP method
other than `GET`. For example, to test a `POST` HTTP request at the url
`http://localhost:3000/something`:

```
$ curl -XPOST http://localhost:3000/something
```

1. Have a look at the [basic routing
   guide](https://expressjs.com/en/starter/basic-routing.html) for express. In the
   previous file, implement a new *route* with the HTTP method `POST` and path `/counter`
   that will *increment* a counter variable.
2. Implement a second `GET` route to *read* the value of this counter.
3. Implement a third `DELETE` route to *reset* the value of this counter.

If your program is correct, you should be able to execute the following `curl` commands in
the terminal, and get the same output: 

```bash
$ curl -XPOST http://localhost:3000/counter
$ curl -XPOST http://localhost:3000/counter
$ curl -XGET http://localhost:3000/counter 
2
$ curl -XDELETE http://localhost:3000/counter
$ curl -XGET http://localhost:3000/counter 
0
```

## Exercise: thermostat over the web

To complete this exercise, you'll have to:
  * instantiate and use the classes written before. 
  * use express to define HTTP routes.
  * use the function `JSON.stringify` to transform a JS object to a string that can be
    sent in a response.

### Questions

1. In the thermostat project directory, create a new file `web.js` for the code running
   the express web server.
2. Implement a route `GET /temperature` to print the thermostat temperature.
3. Implement a route `POST /up` to increase the temperature.
4. Implement a route `POST /down` to decrease the temperature.
5. Implement a route `DELETE /temperature` to reset the thermostat.

If your program is correct, you should be able to execute the following `curl` commands in
the terminal, and get the same output: 

```bash
$ curl -XGET http://localhost:3000/temperature 
{"temperature":20}

$ curl -XPOST http://localhost:3000/up 
$ curl -XPOST http://localhost:3000/up 
$ curl -XGET http://localhost:3000/temperature 
{"temperature":22}

$ curl -XDELETE http://localhost:3000/temperature
$ curl -XGET http://localhost:3000/temperature 
{"temperature":20}
```

Feel free to implement more HTTP routes to expose the other functions of the Thermostat
program (for example, there could be an additional HTTP endpoint to enable or disable the
power-saving mode).

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F07_web_server.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F07_web_server.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F07_web_server.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F07_web_server.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F07_web_server.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
