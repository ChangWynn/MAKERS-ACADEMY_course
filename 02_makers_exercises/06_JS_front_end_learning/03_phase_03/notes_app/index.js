const { NotesModel } = require('./notesModel')
const { NotesView } = require('./notesView')
const { NotesClient } = require('./notesClient')

const model = new NotesModel()
const client = new NotesClient()
const view = new NotesView(model, client)

// model.addNote("Cook Dinner")

// view.displayNotes()
// console.log(model.getNotes())
// client.createNote("HIIIIII", console.log)

// view.displayNotesFromApi()


console.log("The notes app is running")

