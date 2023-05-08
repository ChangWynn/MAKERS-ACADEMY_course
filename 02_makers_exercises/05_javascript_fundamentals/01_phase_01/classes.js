// class User {
//   constructor(name) {
//     this.name = name
//   }
//   getName() {
//     return this.name
//   }
//   getIntroduction() {
//     return `Hi, my name is ${this.getName()}`
//   }
// };

class User {

  constructor(name) {
    this.name = name;
  }

  getName() {
    return this.name;
  }

  getIntroduction() {
    return `Hi, my name is ${this.name}`;
  }

};

module.exports = User;



// console.log(user.getName())
// console.log(user.getIntroduction())


