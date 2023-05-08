as a school company
help teachers tracking how student perform on test
generate a report based on input.

The problem:
given a string of grades Green, Amber and Red, return the count of each of the grades and their count

input = comma separated string containing grades : Green, Amber, Red
empty string = "no results"
unknown grades as uncounted and count number of occurence.

output = new line separated string containg grades and their count.

approach :

1. split the string at commas to get an array.
2. create a hash containing {green: 0, amber: 0, red:0, uncounted: 0}
3. loop over array
4. check element against hash key
5. increment if encountered
6. increment uncounted in hash key not present.
7. return string

examples

"" => "no results has been given"
"Green" => "Green: 1"
"Green, Amber, Red: => "Green: 1\nAmber: 1\nRed: 1"
"Green, Dave, Whimsy" => "Green: 1\nUncounted: 2"
"Dave, Dave, Whimsy" => "Uncounted: 2" 


