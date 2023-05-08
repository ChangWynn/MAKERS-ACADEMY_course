# Write a program that:
# * Calculates the first 20 Fibonacci numbers.
#   * The first Fibonacci number is 0.
#   * The second Fibonacci number is 1.
#   * Every Fibonacci number after that is calculated by adding the
#     previous two Fibonacci numbers together e.g. the third Fibonacci
#     number is the result of `0 + 1`.
# * `puts`es these numbers, one per line.

# set the first two fibonacci numbers
puts num1 = 0
puts num2 = 1

# print out the next 18 fibonacci numbers based on num1 and num2
18.times do 
  current_num = num1 + num2
  puts current_num
  num1 = num2
  num2 = current_num
end