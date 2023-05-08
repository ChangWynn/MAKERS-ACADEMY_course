# Write a program that lets two players play Rock, Paper, Scissors. The program should:
# * Ask player 1 for their move.  They can input `rock`, `paper` or
#   `scissors`.
# * Ask player 2 for their move.  They can input `rock`, `paper` or
#   `scissors`.
# * Calculates who has won.  `rock` beats `scissors`, `paper` beats
#   `rock`, `scissors` beat `paper`.
# * If player 1 has won, `puts`es `Player 1 wins`.
# * If player 2 has won, `puts`es `Player 2 wins`.
# * If the game is a draw, `puts`es `It's a draw`.
#
# * Note: You can assume that players will input one of the three
#   possible moves described above.
#
# * Note: When you run the automated tests, the tests will simulate
#   the user input.  You shouldn't need to enter any input manually.
#   If the tests hang when you run them, it probably means your code
#   doesn't work correctly, yet.
#
# * Note: You can assume the players will only ever input `rock`,
#   `paper` or `scissors`.

puts "rock, paper or scissors?"
puts "Player 1:"
player1 = gets.chomp
puts "Player 2:"
player2 = gets.chomp

player1wins = "Player 1 wins"
player2wins = "Player 2 wins"

puts "It's a draw" if player1 == player2

if player1 == "rock"
  puts player2 == "paper" ? player2wins : player1wins
elsif player1 == "paper"
  puts player2 == "scissors" ? player2wins : player1wins
elsif player1 == "scissors"
  puts player2 == "rock" ? player2wins : player1wins
end