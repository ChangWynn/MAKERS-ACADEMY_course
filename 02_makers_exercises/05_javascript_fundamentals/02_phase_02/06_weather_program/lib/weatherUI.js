const { Weather } = require('../lib/weather');
const { WeatherClient } = require('../lib/weatherClient');

class WeatherUI {
  constructor(data) {
    this.data = data
  }

  displayWeather() {
    return {
      city: this.data["name"],
      weather: this.data["weather"][0]["main"],
      temperature: this.data["main"]["temp"],
      feelsLike: this.data["main"]["feels_like"], 
      humidity: this.data["main"]["humidity"]
    }
  }
}

const client = new WeatherClient();
const weather = new Weather(client)


// weather.load("London")
//   .then(() => {
//     const data = weather.getWeatherData();
//     const ui = new WeatherUI(data);
//     console.log(ui.displayWeather())
//   })



module.exports = { WeatherUI }
