const { WeatherClient } = require('../lib/weatherClient')

class Weather {
  constructor(client) {
    this.client = client;
    this.weatherData = undefined
  }

  async load(location) {
    const weather = await this.client.fetchWeatherData(location);

    this.weatherData = weather
  }

  getWeatherData() {
    return this.weatherData
  }
}

module.exports = { Weather }

// const client = new WeatherClient()

// const weather = new Weather(client)

// weather.load("Paris").then(() => console.log(weather.getWeatherData()))


