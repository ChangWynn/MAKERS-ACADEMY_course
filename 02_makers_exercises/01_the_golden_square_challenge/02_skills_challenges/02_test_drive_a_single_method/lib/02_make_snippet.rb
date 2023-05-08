def make_snippet(string)
  words = string.split
  if words.length > 5 
    return "#{words[0..4].join(" ")}..."
  else
    words[0..4].join(" ")
  end
end