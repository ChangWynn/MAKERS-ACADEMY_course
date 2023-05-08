class WeatherClient {
  constructor() { }

  fetchWeatherData(location) {
    const apiKey = require("./apiKey");
    const city = location;
    const apiURL = `http://api.openweathermap.org/data/2.5/weather?units=metric&q=${city}&appid=${apiKey}`;

    return fetch(apiURL)
      .then(response => response.json())
      .then(data => {
        return data
      })
  }
}

module.exports = { WeatherClient }

// const client = new WeatherClient();

// client.fetchWeatherData('London')
//   .then(weatherData => {
//     console.log(`Weather data for ${weatherData.name}:`);
//     console.log(weatherData)
// })