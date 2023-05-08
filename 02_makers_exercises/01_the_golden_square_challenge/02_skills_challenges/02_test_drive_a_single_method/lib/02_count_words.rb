def count_words(str)
  fail "Argument is not a string object" unless str.is_a? String
  return str.split.length
end

str = "My name is John!"
p count_words(str)