/**
 * @jest-environment jsdom
 */

const { NotesView } = require('./notesView')
const { NotesModel } = require('./notesModel')
const fs = require('fs')

describe(NotesView, () => {

  let view; 
  let notes;
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync('./index.html')
    notes = new NotesModel()
    view = new NotesView(notes)
  })

  it("should be instanciate with a NotesModel instance", () => {
    expect(view.notes).toEqual(notes)
  })

  describe("displayNotes method", () => {
    it("should create a div element witch class note in the HTML document for each notes", () => {
      notes.addNote("Cook Dinner")
      notes.addNote("Wash Dishes")
      view.displayNotes()
      expect(document.querySelectorAll('div.note').length).toBe(2)
    })

    it('can add new notes by button', () =>{
      const button= document.querySelector('#button');
      const input= document.querySelector('#message-input');
      input.value = 'Go gym';
      button.click();
      expect(document.querySelectorAll('div.note').length).toBe(1);
    })

    it('', () => {
      const button= document.querySelector('#button');
      const input= document.querySelector('#message-input');
      input.value = 'Go gym';
      button.click();
      input.value = 'Take Shower';
      button.click();
      expect(document.querySelectorAll('div.note').length).toBe(2)
    })
  })
})