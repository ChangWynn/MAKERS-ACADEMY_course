require "diary_entry"

describe DiaryEntry do
  context "initialize method" do
    it "throws an error if no of arguments is given" do
      expect { DiaryEntry.new }.to raise_error ArgumentError
    end
    it "throws an error if wrong number of arguments is given" do
      expect { DiaryEntry.new("title") }.to raise_error ArgumentError
    end
  end

  context "getter methods" do
    it "returns the title of entry" do
      entry = DiaryEntry.new("title", "contents")
      expect(entry.title).to eq "title"
    end
    it "returns the content of entry" do
      entry = DiaryEntry.new("title", "contents")
      expect(entry.contents).to eq "contents"
    end
  end

  context "count_words method" do
    it "returns 10 for a 10 words long entry" do
      entry = DiaryEntry.new("title", "contents " * 10)
      expect(entry.count_words).to eq 10
    end
  end

  context "reading_time method" do
    it "returns 10 for 100 words long entry and 10 wpm" do
      entry = DiaryEntry.new("title", "contents " * 100)
      expect(entry.reading_time(10)).to eq 10
    end
    it "returns 3 for 100 words long entry and 30 wpm" do
      entry = DiaryEntry.new("title", "contents " * 100)
      expect(entry.reading_time(30)).to eq 4
    end
  end

  context "reading_chunk method" do
    it "returns first chunk of 100 words for wpm = 10 and minutes = 10" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      expect(entry.reading_chunk(10, 10)).to eq "contents " * 99 + "contents"
    end
    it "returns next chunk of 100 words when called again" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      entry.reading_chunk(10, 10)
      expect(entry.reading_chunk(10, 10)).to eq "world " * 99 + "world"
    end
    it "returns content until the end" do
      entry = DiaryEntry.new("title", "contents " * 50 + "world " * 50)
      entry.reading_chunk(10, 3)
      entry.reading_chunk(10, 3)
      expect(entry.reading_chunk(10, 10)).to eq "world " * 39 + "world"
    end
    it "restart at the beginning" do
      entry = DiaryEntry.new("title", "contents " * 100 + "world " * 100)
      entry.reading_chunk(10, 10)
      entry.reading_chunk(10, 10)
      expect(entry.reading_chunk(10, 10)).to eq "contents " * 99 + "contents"
    end
  end
end