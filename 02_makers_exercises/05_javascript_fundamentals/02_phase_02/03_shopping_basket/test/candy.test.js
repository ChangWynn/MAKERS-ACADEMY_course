const { Candy } = require('../lib/candy')

describe(Candy, () => {
  describe("name getter method", () => {
    it("should return the name of a candy", () => {
      const mars = new Candy("Mars", 2);
      expect(mars.getName()).toStrictEqual("Mars");
    });
  });
  describe("price getter method", () => {
    it("should return the name of a candy", () => {
      const mars = new Candy("Mars", 2);
      expect(mars.getPrice()).toStrictEqual(2);
    });
  });
});