class NotesView {
  constructor(model, client) {
    this.client = client;
    this.model = model;

    this.mainContainer = document.querySelector('div#main-container');
    this.buttonEl = document.querySelector("#button");
    this.deleteBtn = document.querySelector("#delete-button");
    
    this.buttonEl.addEventListener('click', () => {

      const input = document.querySelector('#message-input');
      const newData = { "content": input.value };

      this.client.createNote(newData, () => {
        this.displayNotesFromApi();
      }, err => this.displayError(err))
      input.value = "";
    });

    this.deleteBtn.addEventListener('click', () => {
      this.client.reset(() => { this.displayNotesFromApi() });
    });
  }

  displayNotes() {
    const noteClass = document.querySelectorAll('div.note');
    noteClass.forEach((note) => note.remove());

    const notes = this.model.getNotes();
    notes.forEach((note) => {
      const newDiv = document.createElement('div');
      newDiv.classList.add('note');
      newDiv.innerText = note;
      this.mainContainer.append(newDiv);
    });
  };

  displayNotesFromApi() {
    this.client.loadNotes(notes => {
      this.model.reset();
      this.model.setNotes(notes);
      this.displayNotes();
    }, err => this.displayError(err))
  };
  
  displayError(err) {
    // console.log(err)
    const newDiv = document.createElement('div');
    newDiv.classList.add('note');
    newDiv.innerText = "Oops, something went wrong";
    this.mainContainer.append(newDiv);
  };
};

module.exports = { NotesView };