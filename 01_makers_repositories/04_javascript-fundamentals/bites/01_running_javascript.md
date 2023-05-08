# Running JavaScript

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to run JavaScript in the `node` REPL.

## Introduction

You will need to install a program called Node.js (also just called "node"). Node is a
JavaScript *runtime* - which means it reads JavaScript code, and execute it as a program.
This is very similar to, for example, `ruby` or `irb`, which can read and execute Ruby
code, either in files or entered directly into the REPL.

First let's install `nvm` - the Node Version Manager. If you've used Ruby with `rvm`
before, it's a similar tool: `nvm` allows us to install and manage specific Node versions.
You can check the latest Node release on the [releases
page](https://nodejs.org/en/about/releases/). Running `nvm install node` and `nvm use
node` will automatically install and use the latest stable version.

NVM is distributed using github - you can find installation instructions for the latest
version [here](https://github.com/nvm-sh/nvm#installing-and-updating). You'll need to run
a command that looks like this: 

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

Once that step is complete, you'll need to reload your ~/.zshrc file:

```
source ~/.zshrc
```

Now, you can install Node using nvm:

```
$ nvm install node
$ nvm use node
```

If the above works, you should see something like this in your terminal (exact versions
might be different for you!): `Now using node v16.6.0 (npm v7.19.1)` - if something went
wrong, have a look at the [troubleshooting
section](https://github.com/nvm-sh/nvm#troubleshooting-on-macos) or reach out to someone
for help.

Your should now be able to type `node` inside your terminal, to launch the node REPL: 
```
$ node
Welcome to Node.js v16.6.0.
Type ".help" for more information.
> 
```

You should now be able to type some JavaScript code inside it, and see the result of what
you've typed, much like when using `irb`. 

Try with something simple like `2 + 2` and press `enter` to get the result.
Congratulations, you just wrote your first line of JavaScript! Perhaps a slightly boring
one for now, but no worries, more will come soon.

## Demonstration

Stop this video before the exercise starts so you have the chance to try it yourself
first.

[Demonstration Video](https://www.youtube.com/watch?v=dHwxu0T-M0g)

## Exercise

Run this program with JavaScript in the `node` REPL:

```javascript
const name = 'JavaScript';
console.log('Hello, ' + name);
```

This program uses the function `console.log()` to print messages to the console.

[Example solution](https://youtu.be/dHwxu0T-M0g?t=233)

## Additional resources

 * [How to use the node.js REPL](https://nodejs.dev/en/learn/how-to-use-the-nodejs-repl/)


[Next Challenge](02_running_files.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F01_running_javascript.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F01_running_javascript.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F01_running_javascript.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F01_running_javascript.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F01_running_javascript.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
