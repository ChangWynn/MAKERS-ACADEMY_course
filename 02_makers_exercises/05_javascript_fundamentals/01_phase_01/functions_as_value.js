const lowerCaseMessage = (message) => {
  console.log(message.toLowerCase());
};

const transform = (string, aFunction) => {
  return aFunction(string);
};

transform("WHY ARE YOU SHOUTING?", lowerCaseMessage)

// CHALLENGE

const notifyByEmail = (email) => {
  return `Email sent to: ${email}`;
};

const notifyByText = (phoneNumber) => {
  return `Text sent to: ${phoneNumber}`
};

const notify = (string, func) => {
  return func(string);
};

console.log(notify("hello@makers.tech.test", notifyByEmail))
console.log(notify("+10000000000", notifyByText))





