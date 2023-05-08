/**
 * @jest-environment jsdom
 */

const fs = require('fs');
const MessageView = require('./messageView');

describe('MessageView', () => {

  let view;
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync('./index.html');
    view = new MessageView();

  })

  it('clicks the button', () => {
    const buttonEl = document.querySelector('#show-message-button');
    const input = document.querySelector('#message-input').value

    buttonEl.click();
    expect(document.querySelector('#message')).not.toBeNull();
    expect(document.querySelector('#message').innerText).toEqual(input);
  });

  // it('hides the message', () => {
  //   const buttonEl = document.querySelector('#show-message-button');
  //   buttonEl.click();
  //   buttonEl.click();
  //   expect(document.querySelector('#message')).toBeNull();
  // })
});