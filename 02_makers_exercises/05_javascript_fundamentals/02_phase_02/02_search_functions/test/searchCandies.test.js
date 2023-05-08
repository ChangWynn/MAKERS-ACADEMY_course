const searchCandies = require('../lib/searchCandies')

describe(searchCandies, () => {
  it("should return a candy name given exact right information", () => {
    expect(searchCandies("Aero", 2)).toEqual(['Aero']) ;
  })
  it("should return a candy name given a price max", () => {
    expect(searchCandies("Aero", 2)).toEqual(['Aero']);
  })
  it("should return a candies name given a substring", () => {
    expect(searchCandies("S", 6)).toStrictEqual([ 'Skitties', 'Skittles', 'Starburst' ])
  })
  it("should return a candies name given a substring and price Max", () => {
    expect(searchCandies("S", 4)).toStrictEqual([ 'Skitties', 'Skittles' ])
  })
})