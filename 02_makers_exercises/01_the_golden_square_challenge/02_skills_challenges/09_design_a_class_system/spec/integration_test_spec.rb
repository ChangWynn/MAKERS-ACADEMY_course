require "diary"
require "diaryEntry"
require "task"

describe Task do
  context "#add method" do
    it "add a task to a Diary object" do
      diary = Diary.new
      task1 = Task.new("walk the dog")
      task1.add(diary)
      expect(diary.todo_list[:incomplete]).to eq [task1]
    end
  end

  context "#mark_done method" do
    it "marks a task as completed" do
      diary = Diary.new
      task1 = Task.new("walk the dog")
      task1.add(diary)
      task2 = Task.new("wash dishes")
      task2.add(diary)
      task1.mark_done(diary)
      expect(diary.todo_list[:complete]).to eq [task1]
      expect(diary.todo_list[:incomplete]).to eq [task2]
    end
    it "marks a task as completed" do
      diary = Diary.new
      task1 = Task.new("walk the dog")
      task1.add(diary)
      task2 = Task.new("wash dishes")
      task2.add(diary)
      task2.mark_done(diary)
      expect(diary.todo_list[:complete]).to eq [task2]
      expect(diary.todo_list[:incomplete]).to eq [task1]
    end
    it "marks a task as completed" do
      diary = Diary.new
      task1 = Task.new("walk the dog")
      task1.add(diary)
      task2 = Task.new("wash dishes")
      task2.add(diary)
      task1.mark_done(diary)
      task2.mark_done(diary)
      expect(diary.todo_list[:complete]).to eq [task1, task2]
      expect(diary.todo_list[:incomplete]).to eq []
    end
  end
end

describe DiaryEntry do
  context "#add method" do
    it "add an entry to a Diary object" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Hello World today was awesome")
      entry1.add(diary)
      expect(diary.entries).to eq [entry1]
    end
  end
end

describe Diary do
  context "getter methods" do
    it "returns a list of all tasks" do
      diary = Diary.new
      task1 = Task.new("walk the dog")
      task1.add(diary)
      task2 = Task.new("wash dishes")
      task2.add(diary)
      expect(diary.todo_list[:incomplete]).to eq [task1, task2]
    end
    it "returns all entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Hello World today was awesome")
      entry1.add(diary)
      entry2 = DiaryEntry.new("Today was even better than yesterday")
      entry2.add(diary)
      expect(diary.entries).to eq [entry1, entry2]
    end
  end

  context "#phone_numbers method" do
    it "should return an array with a phone number" do
      diary = Diary.new
      entry1 = DiaryEntry.new("hey here is my number: 07123456789")
      entry1.add(diary)
      expect(diary.phone_numbers).to eq ["07123456789"]
    end 
    it "should return a list of phone numbers found from multiple entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("hey here is my number: 07123456789")
      entry1.add(diary)
      entry2 = DiaryEntry.new("Try also: 07987654321")
      entry2.add(diary)
      expect(diary.phone_numbers).to eq ["07123456789", "07987654321"]
    end 
    it "should return a list of phone numbers found in multiple entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("hey here is my number: 07123456789")
      entry1.add(diary)
      entry2 = DiaryEntry.new("Try also: 07987654321")
      entry2.add(diary)
      entry3 = DiaryEntry.new("If not available, try: 07192837465 or 07675849302")
      entry3.add(diary)
      expect(diary.phone_numbers).to include("07123456789", "07987654321", "07192837465", "07675849302")
    end 
    it "should return only valid phone numbers" do
      diary = Diary.new
      entry1 = DiaryEntry.new("hey here is my number: 07123456789")
      entry1.add(diary)
      entry2 = DiaryEntry.new("Try also: 0798765, sorry, here it is: 07987654321")
      entry2.add(diary)
      expect(diary.phone_numbers).to eq ["07123456789", "07987654321"]
    end 
  end

  context "#find_best_entry method" do
    it "should return the content that fits exactly the available reading time" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Hi " * 10)
      entry1.add(diary)
      entry2 = DiaryEntry.new("Hi " * 20)
      entry2.add(diary)
      entry3 = DiaryEntry.new("Hi " * 30)
      entry3.add(diary)
      expect(diary.find_best_entry(10,3)).to eq entry3
    end
    it "should return the content the closest but not over the available reading time" do
      diary = Diary.new
      entry1 = DiaryEntry.new("Hi " * 10)
      entry1.add(diary)
      entry5 = DiaryEntry.new("Hi " * 50)
      entry5.add(diary)
      entry4 = DiaryEntry.new("Hi " * 40)
      entry4.add(diary)
      entry3 = DiaryEntry.new("Hi " * 30)
      entry3.add(diary)
      entry2 = DiaryEntry.new("Hi " * 20)
      entry2.add(diary)
      expect(diary.find_best_entry(9,5)).to eq entry4
    end
  end
end

