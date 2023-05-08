class UserBase {
  constructor(users) {
    this.users = users;
  }

  count() {
    return this.users.length
  }

  getNames() {
    return this.users.map(object => object.name)
  }

  getIntroduction() {
    return this.users.map(object => {
      return (`Hi, my name is ${object.name}`);
    });
  }
}

// module.exports = UserBase;
// const users = [
//   new User('Uma'), 
//   new User('Josh'), 
//   new User('Ollie') 
// ];

const userArray = new UserBase(users)

// console.log(userArray.users)
// console.log(userArray.count())
// console.log(userArray.getNames())
// console.log(userArray.getIntroduction())




 