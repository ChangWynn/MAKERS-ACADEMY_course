require('jest-fetch-mock').enableFetchMocks();
const { NotesClient } = require('./notesClient');

describe('Client class', () => {
  it('should call fetch and get data', (done) => {
    const client = new NotesClient();
    fetch.mockResponseOnce(JSON.stringify(['Hallelujah']));
    client.loadNotes(response => {
      expect(response).toEqual(['Hallelujah']);
      done();
    })
  })

  // it("should handle a rejected promise", () => {
  //   const client = new NotesClient();
  //   fetch.mockReject(new Error('failed to fetch'))
  //   client.loadNotes(, errorHandler => {
  //     expect(error.message).toBe('failed to fetch')
  //   })
  // })

  it('should call fetch and get data', async () => {
    const client = new NotesClient();
    fetch.mockResponseOnce(JSON.stringify(['Hallelujah']));
    await client.loadNotes(response => {
      expect(response).toEqual(['Hallelujah'])
    })
  })

  it('should call fetch and get data', () => {
    const client = new NotesClient();
    fetch.mockResponseOnce(JSON.stringify(['Hallelujah']));
    return client.loadNotes(response => {
    expect(response).toEqual(['Hallelujah']);
    })
  })

  it('should sent a new notes via POST methods', async () => {
    const client = new NotesClient();
    fetch.mockResponseOnce(JSON.stringify(['Hallelujah']));
    await client.createNote('Hallelujah', data => {
      expect(data).toEqual(['Hallelujah'])
    })
  })
})
  