const { Weather } = require('../lib/weather')
const jestFetchMock = require("jest-fetch-mock");

jestFetchMock.enableMocks();


describe(Weather, () => {
  beforeEach(() => {
    fetch.resetMocks();
  })

  describe("api request test", () => {
    it("should send an API request and return a promise", async () => {
      const client = {
        fetchWeatherData: jest.fn(),
      }
      client.fetchWeatherData.mockResolvedValueOnce({
        name: "Bristol"
      })
      const weather = new Weather(client);
      await weather.load("Bristol")
      expect(client.fetchWeatherData).toHaveBeenCalledWith("Bristol");
      const now = weather.getWeatherData();
      expect(now.name).toEqual("Bristol");
    });
  });
});