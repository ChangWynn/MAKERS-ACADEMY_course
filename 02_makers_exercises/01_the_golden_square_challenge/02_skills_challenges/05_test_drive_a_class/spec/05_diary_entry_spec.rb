require "05_diary_entry"

describe DiaryEntry do
  it "throws an error if given wrong number of arguments" do
    expect { DiaryEntry.new("title") }.to raise_error ArgumentError
  end

  it "return title on title method call" do
    entry = DiaryEntry.new("title", "contents")
    result = entry.title
    expect(result).to eq "title"
  end

  it "return contents on contents method call" do
    entry = DiaryEntry.new("title", "contents")
    result = entry.contents
    expect(result).to eq "contents"
  end

  it "returns word counts on count_words method call" do
    entry = DiaryEntry.new("day2", "Today was awesome")
    result = entry.count_words
    expect(result).to eq 3
  end

  it "returns reading time on reading_time method call" do
    entry = DiaryEntry.new("day3", "Today was as awesome as yesterday, I hope tomorrow will be too.")
    result = entry.reading_time(3)
    expect(result).to eq 4
  end

  it "returns chunk of contents when method is called" do
    entry = DiaryEntry.new("day3", "Today was as awesome as yesterday I hope tomorrow will be too")
    result = entry.reading_chunk(3,2)
    expect(result).to eq "Today was as awesome as yesterday"
  end

  it "returns next chunk of contents if method is call again" do
    entry = DiaryEntry.new("day3", "Today was as awesome as yesterday I hope tomorrow will be too")
    entry.reading_chunk(3,2)
    chunk = entry.reading_chunk(3,2)
    expect(chunk).to eq "I hope tomorrow will be too"
  end

  it "restart contents to read if contents has been fully read" do
    entry = DiaryEntry.new("day3", "Today was as awesome as yesterday I hope tomorrow will be too")
    entry.reading_chunk(3,2)
    entry.reading_chunk(3,2)
    chunk = entry.reading_chunk(4,2)
    expect(chunk).to eq "Today was as awesome as yesterday I hope"
  end
end


