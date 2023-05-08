# Running JavaScript files

_**This is a Makers Bite.** Bites are designed to train specific skills or tools. They
contain an intro, a demonstration video, some exercises with an example solution video,
and a challenge without a solution video for you to test your learning. [Read more about
how to use Makers
Bites.](https://github.com/makersacademy/course/blob/main/labels/bites.md)_

Learn to run JavaScript files.

## Introduction

So far, we've been only writing JavaScript inside our `node` REPL. Like other languages,
we can write JavaScript into source files with the `.js` extension. We can run these files
using `node`. Let's try with an example:

```javascript
// file: hello.js

console.log('Hello - I am a file!');
```

Save this code in a file called `hello.js`, and you can now run it from the command line:

```
$ node hello.js

Hello - I am a file!
```

## Demonstration

Stop this video before the exercise starts so you have the chance to try it yourself
first.

[Demonstration Video](https://youtu.be/dHwxu0T-M0g?t=298)

## Exercise

1. Write, in a file `hello.js`, a JavaScript program that logs a greeting message to the
   console.
2. Run this program. You should get the greeting message logged in your terminal.

[Example solution](https://youtu.be/dHwxu0T-M0g?t=489)

## Challenge

Run a JavaScript file that logs the result of `2 + 2` in the console.

## A brief note; on semicolons

You might have noticed that almost every line of JavaScript ends with a semicolon (`;`).
This is actually not specific to JS - other languages have similar syntax - but coming
from Ruby, this might be rather unsettling. It might take some time for you to get used to
type `;` at the end of every line, but don't worry too much: JS is usually quite
permissive if you miss a semicolon, so that shouldn't create too many bugs. However, in
case you're running into a weird bug, you might want to check there isn't a semicolon
missing at the end of a line!

If you want to save yourself the hassle of checking for missing semicolons, a tool like
[Prettier](https://prettier.io/docs/en/install.html) can help to automatically add them
where they're needed (and also make sure your code is properly formatted). To run it so it
automatically formats JS files, you can run the following in any project directory:

```
npx prettier --write .
```

(you'll be prompted to install prettier if this is the first time you're running the
command).

If you don't want to overwrite files, but only check if they're properly formatted, you
can use the `--check` option instead of `--write`. The [VSCode extension is also
available](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) to
make your life easier, if you're using that editor.


[Next Challenge](03_variables_and_visibility.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F02_running_files.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F02_running_files.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F02_running_files.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F02_running_files.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=bites%2F02_running_files.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
