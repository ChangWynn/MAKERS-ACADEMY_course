
user_choice = nil
while true
  user_choice = gets.chomp.to_i
  if user_choice > 3
    puts "Sorry, this item is not available. Try again."
    next
  end
  break
end
return user_choice