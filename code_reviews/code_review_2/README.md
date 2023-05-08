# BandPassFilter

the problem
  as a music company
  i want to pass a soundtrack into a filter and modify waves

input
  array of integers (frequencies)
  default min 40
  default max 1000

  [] => no frequencies has been applied
  invalid input or frequency => raise an error 'corrupted input'

  sample input
  [60,10,45,60,1500]

output
  array of integers (modified frequencies)

  sample output
  [60,40,45,60,1000]

examples

 [] => no frequencies has been applied 
 [10]50, 100 => [40]
 [150] 50, 100 => [100]
 [75] => [75]
 [10, 75] 50, 100
[1500] => [1000]
[10, 50] => [40, 50]
[50, 50] => [50, 50]
[60,10,45,60,1500],20,50 => [50, 20, 45, 50, 50]


 