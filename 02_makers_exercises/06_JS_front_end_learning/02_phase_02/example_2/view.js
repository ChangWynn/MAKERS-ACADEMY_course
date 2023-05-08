class View {
  constructor() {
    this.mainContainerEl = document.querySelector('#main-container');
    console.log(this.mainContainerEl);
  }

  addParagraph(string) {
    const newParagraph = document.createElement('p')
    newParagraph.innerText = string
    this.mainContainerEl.append(newParagraph)
  }

  clearParagraphs() {
    const allParagraph = document.querySelectorAll('p')
    allParagraph.forEach((p) => p.remove())
  }
}

module.exports = View;