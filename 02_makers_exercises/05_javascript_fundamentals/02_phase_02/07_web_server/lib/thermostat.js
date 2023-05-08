class Thermostat {

  constructor() {
    this.temperature = 20;
    this.powerSavingMode = true
  }

  up() {
    if (this.powerSavingMode && this.temperature < 25) {
      this.temperature++;
    }
    else if (!this.powerSavingMode && this.temperature < 32) {
      this.temperature++;
    }
  }
  down() {
    if (this.temperature > 10) { return this.temperature-- }
  }
  setPowerSavingMode(setting) {
    this.powerSavingMode = setting
  }
  reset() {
    this.temperature = 20
  }
  currentEnergyUsage() {
    if (this.temperature < 18) { return "low-usage" }
    if (this.temperature > 25) { return "high-usage" }
    return "medium-usage"
  }
}

const thermostat = new Thermostat

for (let i = 0; i < 15; i++) { thermostat.up() }
console.log(thermostat.temperature)

thermostat.setPowerSavingMode(false)
for (let i = 0; i < 15; i++) { thermostat.up() }
console.log(thermostat.temperature)
console.log(thermostat.currentEnergyUsage())

thermostat.reset()
console.log(thermostat.temperature)
console.log(thermostat.currentEnergyUsage())

module.exports = { Thermostat }


