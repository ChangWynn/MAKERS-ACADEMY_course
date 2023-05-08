/**
 * @jest-environment jsdom
 */

const fs = require('fs');
const View = require('./view');

describe('Page view', () => {

  let view;
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync('./index.html');
    view = new View();
  })

  it('displays 2 paragraphs', () => {
    expect(document.querySelectorAll('p').length).toBe(2);
  });

  it('displays 3 paragraphs if addParagraph is called once', () => {
    view.addParagraph("Hello")
    expect(document.querySelectorAll('p').length).toBe(3)
  })
  it('removes all paragraphs when clearParagraphs is called', () => {
    view.clearParagraphs()
    expect(document.querySelectorAll('p').length).toBe(0)
  })
});