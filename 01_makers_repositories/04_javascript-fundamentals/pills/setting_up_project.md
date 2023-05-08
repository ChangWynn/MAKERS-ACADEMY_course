# Setting up a JavaScript project

Learn to set up a new JavaScript project with NPM and Jest.

## Concise guidance

We use NPM (Node package manager) to setup and manage a JavaScript project, and its dependencies (libraries or packages).

This guidance assumes you have NVM (the Node version manager) installed - if not, head to [this page](../bites/01_running_javascript.md) to install it first.

```bash
# Setup our environment to use node latest version
$ nvm use node

# Create the project directory
$ mkdir my-project
$ cd my-project

# Initialise the NPM project (this will create a file package.json)
$ npm init -y

# Add the jest package to our project
# (this will update package.json and package-lock.json)
$ npm add jest

# Also install jest "globally"
# (this is so we can run the `jest` command)
$ npm install -g jest

# Run our tests
$ jest
```

## Detailed guidance

In most programming languages, we can use libraries, which are made of code already written for us to solve a specific problem.  In JavaScript, libraries are called `packages` and are listed in a file called `package.json`, located in the project directory root. To create an empty `package.json` file, run the following command inside a new project directory:
```
$ npm init -y
```

(The `-y` option skills all the questions we don't need to answer about the info contained in `package.json`)

You should now have something that looks like this:
```json
{
  "name": "js-week",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {},
  "author": "",
  "license": "ISC",
  "bugs": {},
  "homepage": ""
}
```

We're going to install our first package: `jest`. We'll use it to run unit tests for our JS code.

To install it, run `npm install -g jest`. The `-g` option installs Jest "globally", so we can later run tests in a given project using the command `jest` — this will make our life easier.

**We *also* need to run `npm add jest` *inside the project directory*.** The package will be saved in the `node_modules` folder.

This folder can get very big, so if you are planning on committing this project, you should add `node_modules` to your `.gitignore` file before you do. It also allows us to use the jest command when we are in this folder.

That might be the time for a quick tea or coffee break. If everything worked, you should see an output similar to this one inside your terminal:

```
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN jest-1@1.0.0 No description
npm WARN jest-1@1.0.0 No repository field.

+ jest@27.0.6
added 328 packages from 269 contributors and audited 328 packages in 33.686s

24 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```

When running `jest` inside the terminal, we should see a message such as "No tests found, exiting with code 1". There are no tests written yet — it's time to start writing some!

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fsetting_up_project.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fsetting_up_project.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fsetting_up_project.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fsetting_up_project.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=pills%2Fsetting_up_project.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
