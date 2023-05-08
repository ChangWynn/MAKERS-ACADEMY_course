def checking_grammar (str)
  fail "Argument is not a string object" unless str.is_a? String
  
  if str[0].match?(/[A-Z]/) && str[-1].match?(/[\.\!\?]/)
     return "The grammar is correct" 
  else    
    return "The grammar is incorrect"
  end
end
