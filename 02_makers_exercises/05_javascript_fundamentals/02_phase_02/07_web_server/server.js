const express = require('express');
const app = express();
const port = 3000;

let counter = 0

app.get('/', (req, res) => {
  res.send('Hello the world')
});
app.get('/counter', (req, res) => {
  res.send(`Counter value: ${counter}`);
});

app.post('/counter', (req, res) => {
  counter++;
  res.send(`Counter incremented`);
});

app.delete('/counter', (req, res) => {
  counter = 0
  res.send('Counter has been reset to 0')
})

console.log(`server listening on localhost:${port}`);
app.listen(port);