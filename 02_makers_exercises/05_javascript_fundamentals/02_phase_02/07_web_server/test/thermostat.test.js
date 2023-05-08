const {Thermostat} = require('../lib/thermostat')

describe(Thermostat, () => {
  it("should start at 20degrees", () => {
    const thermostat = new Thermostat;
    expect(thermostat.temperature).toEqual(20);
  });

  describe("up", () => {
    it("should increase the temperature by one", () => {
      const thermostat = new Thermostat;
      thermostat.up();
      thermostat.up();
      expect(thermostat.temperature).toEqual(22);
    });
    it("should not increase over 25 degrees when saving power mode is on", () => {
      const thermostat = new Thermostat;
      for (let i = 0; i < 10; i++) {
        thermostat.up();
      };
      expect(thermostat.temperature).toEqual(25)
    });
  });

  describe("down", () => {
    it("should decrease the temperature by one", () => {
      const thermostat = new Thermostat;
      thermostat.up();
      thermostat.up();
      thermostat.down();
      expect(thermostat.temperature).toEqual(21);
    });
    it("should not decrease below 10 degrees", () => {
      const thermostat = new Thermostat;
      for (let i = 0; i < 15; i++) {
        thermostat.down();
      };
      expect(thermostat.temperature).toEqual(10);
    });
  });

  describe("setPowerSavingMode", () => {
    it("should be by default on", () => {
      const thermostat = new Thermostat;
      expect(thermostat.powerSavingMode).toEqual(true);
    });
    it("should be by default on", () => {
      const thermostat = new Thermostat;
      expect(thermostat.powerSavingMode).toEqual(true);
    });
    it("should be able to be switched off", () => {
      const thermostat = new Thermostat;
      thermostat.setPowerSavingMode(false);
      expect(thermostat.powerSavingMode).toEqual(false);
    });
  });

  describe("reset", () => {
    it("should reset the thermostat to 20degrees", () => {
      const thermostat = new Thermostat;
      for (let i = 0; i < 15; i++) {
        thermostat.down();
      };
      expect(thermostat.temperature).toEqual(10);
      thermostat.reset();
      expect(thermostat.temperature).toEqual(20);
    });
  });

  describe("currentEnergyUsage", () => {
    it("should display low-usage if temperature is below 18degrees", () => {
      const thermostat = new Thermostat;
      for (let i = 0; i < 3; i++) {
        thermostat.down();
      };
      expect(thermostat.currentEnergyUsage()).toEqual("low-usage");
    })
    it("should display high-usage if temperature is higher than 25degrees", () => {
      const thermostat = new Thermostat;
      thermostat.setPowerSavingMode(false)
      for (let i = 0; i < 10; i++) {
        thermostat.up();
      };
      expect(thermostat.currentEnergyUsage()).toEqual("high-usage");
    })
    it("should display medium-usage if temperature is between 18 and 25degrees", () => {
      const thermostat = new Thermostat;
      expect(thermostat.currentEnergyUsage()).toEqual("medium-usage");
    })
  })
});