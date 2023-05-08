const {NotesModel} = require('./notesModel.js');

describe('NotesModel', () => {
  let model; 
  beforeEach(() => {
    model = new NotesModel();
  })
  it('calls getNotes and returns an empty array', () => {
    const x = model.getNotes();
    expect(x).toEqual([]);
  })

  it('adds a note to the notes model', () => {
    model.addNote('pair with Kera and Chang');
    const x = model.getNotes();
    expect(x).toEqual(['pair with Kera and Chang']);
  })

  it('adds two notes to the notes model', () => {
    model.addNote('pair with Kera and Chang');
    model.addNote('complete Tekken 3');
    const x = model.getNotes();
    expect(x).toEqual(['pair with Kera and Chang', 'complete Tekken 3' ]);
  })

  it('adds two notes, then resets for an empty note model', () => {
    model.addNote('find my laptop');
    model.addNote('lose laptop');
    model.reset();
    const x = model.getNotes();
    expect(x).toEqual([]);
  })
})