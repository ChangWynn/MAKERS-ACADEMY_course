class DiaryEntry 
  def initialize(content)
    @content = content
  end

  def add(diary_object)
    diary_object.entries << self
  end

  def count_words
    return @content.split.count
  end

  def extract_phone_num
    phone_numbers = []
    @content.scan(/\d+/).each do |num|
      valid = num.length == 11
      phone_numbers << num if valid
    end
    return phone_numbers
  end
end