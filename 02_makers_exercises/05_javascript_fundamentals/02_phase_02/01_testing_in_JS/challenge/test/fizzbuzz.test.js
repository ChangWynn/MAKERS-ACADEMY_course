const fizzbuzz = require('../lib/fizzbuzz');

describe(fizzbuzz, () => {
  it("should return 'FizzBuzz' when given 15", () => {
    expect(fizzbuzz(15)).toBe("FizzBuzz");
  })
  it("should return 'Fizz' when given 3", () => {
    expect(fizzbuzz(3)).toBe("Fizz");
  })
  it("should return 'Buzz' when given 5", () => {
    expect(fizzbuzz(5)).toBe("Buzz");
  })
  it("should return 'FizzBuzz' when num is divisible by 30", () => {
    expect(fizzbuzz(30)).toBe("FizzBuzz");
  })
  it("should return 'Buzz' when num is divisible by 5", () => {
    expect(fizzbuzz(10)).toBe("Buzz");
  })
  it("should return 'Fizz' when num is divisible by 3", () => {
    expect(fizzbuzz(6)).toBe("Fizz");
  })
  it("should return the number when it's neither divisible by 3 nor by 5", () => {
    expect(fizzbuzz(7)).toBe(7);
  })
})