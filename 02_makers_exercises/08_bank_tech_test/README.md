# Bank Tech Test

![test](https://img.shields.io/badge/test-100%25-brightgreen?style=flat-square&logo=github)
![coverage](https://img.shields.io/badge/coverage-100%25-brightgreen?style=flat-square&logo=github)

![test](https://img.shields.io/badge/javascript-grey?style=flat-square&logo=javascript)
![test](https://img.shields.io/badge/node.js-grey?style=flat-square&logo=nodedotjs)
![test](https://img.shields.io/badge/jest-grey?style=flat-square&logo=jest)
![test](https://img.shields.io/badge/eslint-grey?style=flat-square&logo=eslint)

## Contents
  - [Approach](#approach)
  - [Getting Started](#getting-started)
  - [How to use](#how-to-use)
  - [Run the tests](#run-the-tests)
---
## Approach
### Introduction
As simplistic as it may look as per requirements, this is a program that has potential to grow and become a lot more complex so scalability was my first concern when approaching the test. The program has to allow easy changes to adapt to a potential growth and a code that is easy to change is a code that has a well implemented separation of concerns. 

### The structure
Here, a user can interact with the program, the program handles some data and the user can see its balance. It appears clear to me that this program can benefit from the popular MVC architecture to structure its functionality. Therefore, I chose to use three classes to separate each concern:
  - The model will be responsible for storing and manipulating data. It will represent all the logic behind the program.
  - The view will be responsible for rendering and presenting data to the user in a formatted way.
  - The controller will be responsible for handling user input and coordinating communication between the model and the view. It has no logic involved.

Each transaction is also an instance of a transaction class which brings the total number of classes used for this program to four.

In my solution, the view has methods to format dates and figures. I chose to place them in the class prototype property for reusability. 

Though this is an app in an early stage of development, it is a banking app nonetheless so it seemed to be a logical decision to make the properties of the model and transaction class private. They are not directly accessible and can be interacted with via getter and setter methods for security purposes.

Classes are short (less than 30 lines) and so are methods (less than 5 lines) which help readability and improve code quality.

### Why these choices?
With this pattern, I believe it will be easier to add features to any of these aspects if the program were to grow. The model could hold more data such as the user's personal details, account number or pin code, the view would have new methods to render and present these data and the user will be able to interact with them via new methods in the controller. Transactions too are capable of adapting to changes since they have their own class. We can imagine them to be made from one user to another and store information about the recipient for example.

These features are not implemented in this program but this approach allows current features to be easily changed and new features to be easily added without breaking the single responsibility principle and the code quality.

### Conclusion
In conclusion, the current program satisfies the test requirements but also the separation of concerns principle. It allows scalability and is easy to change and maintain.

![diagram](/images/diagram.png)

---
## Getting started

Download or clone this repository and run the following commands:
> If you already have NVM and Node installed, jump to step 3
<br>

1. Install NVM - once done, restart your terminal
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
2. Install Node.js
```
nvm install node
nvm use node
```
3. Install dependencies
```
npm install
```
---
## How to use
  - Open the node REPL
```
node
```
  - Import `accountController.js` and `accountModel.js` or copy and paste the followings
```
const AccountController = require('./lib/accountController')
const AccountModel = require('./lib/accountModel')
```
  - Create a new model:
```
const model = new AccountModel()
```
  - Create a new controller and pass the model as argument:
```
const controller = new AccountController(model)
```

The controller have three methods that you can call:
  - deposit(amount)
  - withdraw(amount)
  - viewStatement()
  
Example:
```
controller.deposit(1000)
controller.deposit(2000)
controller.withdraw(500)
controller.viewStatement()
```
![test and coverage](/images/running_the_program.png)
---
## Run the tests
```
jest
```
![test and coverage](/images/tests_and_coverage.png)

