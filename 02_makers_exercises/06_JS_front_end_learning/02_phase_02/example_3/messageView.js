class MessageView {
  constructor() {
    this.mainContainer = document.querySelector('div');
    this.buttonEl = document.querySelector('#show-message-button');
    this.buttonEl.addEventListener('click', () => {
       this.displayMessage();
    });
  }

    displayMessage() {
    const userInput = document.querySelector('input#message-input').value
      const newDiv = document.createElement('div');
      newDiv.id = 'message'
      newDiv.innerText = userInput
      this.mainContainer.appendChild(newDiv)
    }
  }

module.exports = MessageView;