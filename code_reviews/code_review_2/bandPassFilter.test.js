const bandPassFilter = require('./bandPassFilter')

describe('bandPassFilter', () => {
  it("should return 'no frequencies has been applied' when given an empty array", () => {
    const result = bandPassFilter([])
    expect(result).toEqual("no frequencies has been applied")
  }) 

  it("should modify the frequency if lower than the low threshold", () => {
    const result = bandPassFilter([10], 50, 100)
    expect(result).toEqual([50])
  })

  it("should modify the frequency if higher than the high threshold", () => {
    const result = bandPassFilter([150], 50, 100)
    expect(result).toEqual([100])
  })

  it("should not change the frequency if between the low and high threshold", () => {
    const result = bandPassFilter([75], 50, 100)
    expect(result).toEqual([75])
  })

  it("should iterate over an array and check each frequency", () => {
    const result = bandPassFilter([75, 10], 50, 100)
    expect(result).toEqual([75, 50])
  })
})