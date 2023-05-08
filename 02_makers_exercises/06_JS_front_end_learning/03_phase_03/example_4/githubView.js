class GithubView {
  constructor(model, client) {
    this.model = model;
    this.client = client;

    const submitButtonEl = document.querySelector('#submit-button');
    const repoInputEl = document.querySelector('#repo-name-input');

    submitButtonEl.addEventListener('click', () => {
      const repoName = repoInputEl.value;

      this.client.getRepoInfo(repoName, repoData => {
        console.log(repoData)
        this.model.setRepoInfo(repoData);
        const data = this.model.getRepoInfo()
        this.display(data)
      });
    });
  }

  display(data) {
    const fullName = document.querySelector('h3#repo-name')
    const description = document.querySelector('p#repo-description')
    const img = document.querySelector('img#repo-img')
    fullName.innerText = data.full_name
    description.innerText = data.description
    img.src = `${data.organization.avatar_url}`
  }
}

module.exports = GithubView;