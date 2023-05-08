










class NotesClient {
  loadNotes(callback, errorHandler) {
      fetch('http://localhost:3000/notes')
      .then(response => response.json())
      .then(data => callback(data))
      .catch(err => { 
        errorHandler(err)
      })
  }

  createNote(data, callback, errorHandler) {
    fetch('http://localhost:3000/notes', {
      method: "POST",
      headers: {
        "Content-Type": 'application/json',
      },
      body: JSON.stringify(data),
    }).then(response => response.json())
      .then((data) => callback(data))
      .catch((err) => { 
        errorHandler(err)
      })
  }


  reset(callback) {
    fetch('http://localhost:3000/notes', {
      method: "DELETE",
      headers: {
        "Content-Type": 'application/json',
      },
    }).then(response => response.json())
      .then((data) => callback(data))
  }
}


module.exports = { NotesClient }

