const readline = require('node:readline');
const { Weather } = require('../lib/weather');
const { WeatherClient } = require('../lib/weatherClient');
const { WeatherUI } = require('../lib/weatherUI')

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
})

const client = new WeatherClient();
const weather = new Weather(client)

const getWeather = (city) => {
  weather.load(city)
    .then(() => {
      const data = weather.getWeatherData();
      const ui = new WeatherUI(data);
      console.log(ui.displayWeather())
    })
  }


rl.question("Enter the name of a city: ", (city) => {
  getWeather(city);
  setInterval(() => getWeather(city), (1000 * 60 * 5))
})


console.log("Weather for:")


