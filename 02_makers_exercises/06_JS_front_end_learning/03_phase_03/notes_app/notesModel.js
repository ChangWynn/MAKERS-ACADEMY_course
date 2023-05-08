class NotesModel {
  constructor() {
    this.notes = [];
  }

  getNotes() {
    return this.notes;
  }

  setNotes(notes) {
    notes.forEach((note) => {
      this.notes.push(note);
    })
  }

  addNote(string) {
    this.notes.push(string);
  }

  reset() {
    this.notes = [];
  }
}

module.exports = { NotesModel }