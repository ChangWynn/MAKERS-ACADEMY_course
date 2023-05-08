const apiKey = require('./apiKey');
const city = "London";
const apiURL = `http://api.openweathermap.org/data/2.5/weather?units=metric&q=${city}&appid=${apiKey}`;

let weatherData = null;

fetch(apiURL)
  .then(response => response.json())
  .then(weatherData => console.log(weatherData))


console.log("Requesting Weather Data")




