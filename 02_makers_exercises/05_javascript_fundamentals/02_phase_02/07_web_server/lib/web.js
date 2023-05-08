const express = require('express');
const app = express();
const port = 3000;
const { Thermostat } = require('./thermostat')

const ac = new Thermostat()

app.get('/temperature', (req, res) => {
  
  res.send(`${ac.temperature}`)
})
app.post('/up', (req, res) => {
  ac.up()
  res.send(`temperature +1˚C`)
})
app.post('/down', (req, res) => {
  ac.down()
  res.send(`temperature -1˚C`)
})
app.delete('/temperature', (req, res) => {
  ac.reset()
  res.send(`temperature reset`)
})

console.log(`server listening on localhost:${port}`);
app.listen(port);