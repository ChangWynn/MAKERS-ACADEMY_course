class GrammarStats
  def initialize
    @sentence = ""
  end

  def check(text) # text is a string
    @sentence = text
    return false if @sentence == ""
    is_valid = @sentence[0].match?(/[A-Z]/) && @sentence[-1].match?(/[\.\!\?]/)
    return is_valid ? true : false
  end

  def percentage_good
  end
end

