const bandPassFilter = (frequencies, min, max) => {
  if (frequencies.length === 0) return "no frequencies has been applied"
  
  return frequencies.map((frequency) => {
    if (frequency < min) {
      return min
    }
    else if (frequency > max) {
      return max
    }
    else {
      return frequency
    }
  })

}

module.exports = bandPassFilter