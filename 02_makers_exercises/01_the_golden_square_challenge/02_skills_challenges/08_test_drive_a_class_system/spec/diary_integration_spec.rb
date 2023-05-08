require "diary"
require "diary_entry"

describe Diary do
  context "#add method" do
    it "adds a single Diary_entry object to the Diary class" do
      entry = DiaryEntry.new("title", "contents")
      diary = Diary.new
      diary.add(entry)
      expect(diary.entries).to eq [entry]
    end
  end

  context "#all method" do
    it "adds multiple Diary_entry objects to the Diary class" do
      entry1 = DiaryEntry.new("title", "contents")
      entry2 = DiaryEntry.new("day1", "fast day")
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [entry1, entry2]
    end
  end

  context "#count_words method" do
    it "returns 15 words from all entries contents" do
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry2 = DiaryEntry.new("day2", "contents2 " * 5)
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.count_words).to eq 15
    end
  end

  context "#reading_time method" do
    it "returns the estimated reading time of all the contents" do
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry2 = DiaryEntry.new("day2", "contents2 " * 10)
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(5)).to eq 4
    end
    it "rounds up the estimate of reading time" do
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry2 = DiaryEntry.new("day2", "contents2 " * 10)
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.reading_time(6)).to eq 4
    end
  end

  context "#reading_time method" do
    it "returns the content that matches the available reading time" do
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry2 = DiaryEntry.new("day2", "contents2 " * 20)
      entry3 = DiaryEntry.new("day3", "contents3 " * 30)
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      expect(diary.find_best_entry_for_reading_time(5,4)).to eq "contents2 " * 20
    end
    it "returns the content that is the closest but not over the available reading time" do
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry2 = DiaryEntry.new("day2", "contents2 " * 20)
      entry3 = DiaryEntry.new("day3", "contents3 " * 30)
      diary = Diary.new
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      expect(diary.find_best_entry_for_reading_time(3,5)).to eq "contents1 " * 10
    end
    it "select the content that is the closest but not over the available reading time" do
      entry2 = DiaryEntry.new("day2", "contents2 " * 20)
      entry4 = DiaryEntry.new("day4", "contents4 " * 40)
      entry1 = DiaryEntry.new("day1", "contents1 " * 10)
      entry3 = DiaryEntry.new("day3", "contents3 " * 30)
      entry5 = DiaryEntry.new("day5", "contents5 " * 50)
      diary = Diary.new
      diary.add(entry2)
      diary.add(entry4)
      diary.add(entry1)
      diary.add(entry3)
      diary.add(entry5)
      expect(diary.find_best_entry_for_reading_time(9,5)).to eq "contents4 " * 40
    end
  end
end







