# A Thermostat

## Objectives

 * Test-drive a JavaScript class.

You'll build, test-driving your code, a simple program to manage a thermostat. Here is the
specification for the initial MVP of the program:

* The Thermostat starts with an initial temperature of 20 degrees
* You can increase the temperature with an `up` method
* You can decrease the temperature with a `down` method
* The *minimum possible temperature* is 10 degrees
* The *Power saving mode* is *on by default* but it can also be turned off
* *If power saving mode is on*, the maximum temperature is 25 degrees
* *If power saving mode is off*, the maximum temperature is 32 degrees
* You can reset the temperature to 20 with a `reset` method
* You can ask about the thermostat's *current energy usage*: < 18 is low-usage, <= 25 is
  medium-usage, anything else is high-usage.

You'll know if your class `Thermostat` is correctly implemented if you can run the
following code. **Your tests should also reflect the same requirements.**

```javascript
const thermostat = new Thermostat();

thermostat.getTemperature(); // should return 20

thermostat.up();
thermostat.up();
thermostat.getTemperature(); // should now return 22

thermostat.down();
thermostat.getTemperature(); // should now return 21

thermostat.setPowerSavingMode(true); // PSM is now on, max temperature is 25

for (let i = 0 ; i < 10 ; i++) {
  thermostat.up();
}

thermostat.getTemperature(); // should be 25 (max reached)

thermostat.setPowerSavingMode(false); // PSM is now off, max temperature is no more 25

thermostat.up();
thermostat.getTemperature(); // should now return 26

thermostat.reset();
thermostat.getTemperature(); // should be back to 20
```

**Test-drive, one step at a time, each of those steps.** If you're having trouble with
this exercise, go back a few sections and review what you've previously learned in it.
Think about how to write a test for a class in JS. Then, think about how to write this
class in its own file (probably named `thermostat.js`), and what methods should be
implemented.

If you're having trouble, here's a more detailed walkthrough you can follow:

<details><summary>Reveal walkthrough steps</summary>
<p>

1. To setup the project, create a directory and initialise the `package.json` file using
   `npm init`.
2. Install the Jest library using `npm add jest`.
3. Now write a first test file named `thermostat.test.js` and write a simple unit test for
   the `Thermostat` class. A new instance of this class should be initialised with a
   property `temperature` set to 20. You may have a `getTemperature` method on this
   instance to retrieve this value. This is the method you should test.
4. Now write the class `Thermostat` in its file `thermostat.js`. Implement the constructor
   to initialise the `temperature` property to 20, and the `getTemperature` method.
5. Verify your code by running `jest`. Don't forget to use `module.exports` and `require`
   to use the class in the test file!
6. Test-drive and implement the two other methods `up` and `down`, following the same
   process.
7. Having a minimum temperature will likely require a condition to check whether we can
   decrease the temperature further in `down`. Don't forget to test-drive this step as
   well!
8. Implementing power saving mode will require more properties and more conditional checks
   when changing the temperature. Don't forget to test-drive this step as well!


</p>
</details>

It's important that you try to implement a solution to this exercise, however incomplete
it is. 



[Next Challenge](05_calling_apis.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F04_thermostat.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F04_thermostat.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F04_thermostat.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F04_thermostat.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fjavascript-fundamentals&prefill_File=challenges%2F04_thermostat.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
