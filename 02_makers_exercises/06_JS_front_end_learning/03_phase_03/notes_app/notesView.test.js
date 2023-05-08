/**
 * @jest-environment jsdom
 */

const fs = require('fs')
const { NotesClient } = require('./notesClient')
const { NotesView } = require('./notesView')
const { NotesModel } = require('./notesModel')
require('jest-fetch-mock').enableFetchMocks()

describe(NotesView, () => {

  let client;
  let view; 
  let notes;
  beforeEach(() => {
    fetch.resetMocks();
    document.body.innerHTML = fs.readFileSync('./index.html')
    client = new NotesClient()
    notes = new NotesModel()
    view = new NotesView(notes, client)
  })

  describe("displayNotes method", () => {
    it("should create a div element witch class note in the HTML document for each notes", () => {
      notes.addNote("Cook Dinner")
      notes.addNote("Wash Dishes")
      view.displayNotes()
      expect(document.querySelectorAll('div.note').length).toBe(2)
    })

    // it('can add new notes by button', () => {
    //   const button= document.querySelector('#button');
    //   const input= document.querySelector('#message-input');
    //   input.value = 'Go gym';
    //   button.click();
    //   expect(document.querySelectorAll('div.note').length).toBe(1);
    // })

    // it('', () => {
    //   const button= document.querySelector('#button');
    //   const input= document.querySelector('#message-input');
    //   input.value = 'Go gym';
    //   button.click();
    //   input.value = 'Take Shower';
    //   button.click();
    //   expect(document.querySelectorAll('div.note').length).toBe(2)
    // })

    it('should display note from the server', async () => {
      // document.body.innerHTML = fs.readFileSync('./index.html');

      const clientMock = {
        loadNotes: jest.fn()
      }

      clientMock.loadNotes.mockImplementation(callback => {
        callback(['This note is coming from the server'])
      })
      const newNotes = new NotesModel()
      const newView = new NotesView(newNotes, clientMock)
      await newView.displayNotesFromApi()
      expect(newNotes.getNotes()).toEqual(['This note is coming from the server'])
      expect(document.querySelector('div.note').innerText).toEqual('This note is coming from the server')
    })

    it('should create a new note after the user click the button', () => {
      document.body.innerHTML = fs.readFileSync('./index.html')
      const clientMock = {
        loadNotes: jest.fn(),
        createNote: jest.fn()
      }
      const newModel = new NotesModel();
      const newView = new NotesView(newModel, clientMock);
  
      clientMock.createNote.mockImplementation((data, callback, _) => callback() );
      clientMock.loadNotes.mockImplementation((callback, _) => callback(["Go shopping"]));
      
      const addButton = document.querySelector("#button");
      const input = document.querySelector("#message-input");
      input.value = "Go shopping";
      addButton.click();
      expect(newModel.getNotes()).toEqual(["Go shopping"])
      expect(document.querySelector("div.note").innerText).toBe("Go shopping");
    })

    it("should delete all notes from the server", () => {
      document.body.innerHTML = fs.readFileSync('./index.html')
      const clientMock = {
        reset: jest.fn().mockImplementation(callback => callback()),
        loadNotes: jest.fn().mockImplementation((callback, _) => callback([]))
      }
      const newView = new NotesView(notes, clientMock)
      const deleteButton = document.querySelector("#delete-button");

      deleteButton.click();
      expect(document.querySelectorAll("div.note").length).toBe(0);
    })
  })
})
