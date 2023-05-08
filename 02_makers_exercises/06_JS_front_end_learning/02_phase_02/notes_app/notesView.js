class NotesView {
  constructor(notes) {
    this.notes = notes
    this.mainContainer = document.querySelector('div#main-container')
    this.buttonEl = document.querySelector("#button") ;

    this.buttonEl.addEventListener('click', () => {
      // this.notes.reset()
      const input = document.querySelector('#message-input');
      this.notes.addNote(input.value);
      this.displayNotes();
      input.value = ""
    })
  }

  displayNotes() {
    const noteClass = document.querySelectorAll('div.note')
    noteClass.forEach((note) => note.remove())

    const notes = this.notes.getNotes()
    notes.forEach((note) => {
      const newDiv = document.createElement('div')
      newDiv.classList.add('note')
      newDiv.innerText = note
      this.mainContainer.append(newDiv)
    })
  }
}

module.exports = { NotesView }