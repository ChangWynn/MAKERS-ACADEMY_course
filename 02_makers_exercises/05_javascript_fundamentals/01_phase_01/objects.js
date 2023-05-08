const person = {
  name: "Maxine",
  age: 32,
  address: { city: "London", postcode: "E1 123" },
  hobbies: ["writing", "tennis", "cooking"]
};

// console.log(person["address"]["city"])
// console.log(person["hobbies"][1])

const cohort = {
  name: "May 2022",
  id: 1234,
  students: ["Chang", "student1", "student2"]
};

const printObject = (object) => {
  return `${object["id"]} - ${object["name"]} - ${object["students"].length} students in this cohort`
}