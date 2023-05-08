// const array = [`Chang`, `Yvonne`, `Hieu`, `Tony`];
// console.log(array.length)
// console.log(array[1])
// array.push(`Denis`)
// console.log(array)

const arr = Array.from({ length: 10 }, (_, i) => i + 1)

console.log(arr)

const sum = arr.reduce((sum, num) => sum + num)

// let sum = 0
// const total = arr.forEach(num => sum += num)


// console.log(sum)

// CHALLENGE

const addToBatch = (array, number) => {
  if (array.length >= 5) { return array }
  else { array.push(number) }
  return array
}

console.log(addToBatch([1], 3))
console.log(addToBatch([1, 2, 3], 4))
console.log(addToBatch([], 8))
console.log(addToBatch([1, 2, 3, 4, 5, 6], 7))
console.log(addToBatch([1, 2, 3, 4, 5, 6, 8, 9], 10))



