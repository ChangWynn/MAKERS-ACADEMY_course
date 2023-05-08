const multiply = require('../lib/multiply')

describe("multiply", () => {
  it("multiply 2 by 2", () => {
    expect(multiply(2, 2)).toBe(4)
  })
})