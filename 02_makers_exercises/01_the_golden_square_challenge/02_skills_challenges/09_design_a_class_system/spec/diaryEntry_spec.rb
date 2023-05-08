require "diaryEntry"

describe DiaryEntry do
  context "#initialize method" do
    it "should create a new instance of DiaryEntry" do 
      entry1 = DiaryEntry.new("Today was awesome")
      expect(entry1).to eq entry1
    end
  end

  context "#count_words method" do
    it "should count 3 words for 'today was awesome'" do
      entry1 = DiaryEntry.new("Today was awesome")
      expect(entry1.count_words).to eq 3
    end
    it "should count 5 words in 'Hello World today was awesome'" do
      entry1 = DiaryEntry.new("Hello World today was awesome")
      expect(entry1.count_words).to eq 5
    end
  end

  context "#extract_phone_num" do
    it "should return a phone number as a string in an array" do
      entry1 = DiaryEntry.new("07123456789")
      expect(entry1.extract_phone_num).to eq ["07123456789"]
    end
    it "should return an array of phone numbers as strings" do
      entry1 = DiaryEntry.new("07123456789, 07987654321")
      expect(entry1.extract_phone_num).to eq ["07123456789", "07987654321"]
    end
    it "should return only phone numbers as strings when content also contains text characters" do
      entry1 = DiaryEntry.new("hey here is my number: 07123456789. Try also 07987654321")
      expect(entry1.extract_phone_num).to eq ["07123456789", "07987654321"]
    end
    it "should ignore numbers that are not 11 digits long" do
      entry1 = DiaryEntry.new("hey here is my number: 0712345678. Try also 07987654321")
      expect(entry1.extract_phone_num).to eq ["07987654321"]
    end
    it "should return an empty array if content does not contain valid numbers" do
      entry1 = DiaryEntry.new("hey here is my number: 07123456. Try also 07987654321434")
      expect(entry1.extract_phone_num).to eq []
    end
    it "should return empty array if content is empty" do
      entry1 = DiaryEntry.new("")
      expect(entry1.extract_phone_num).to eq []
    end
  end
end