require "diary"

describe Diary do
  context "#initialize method" do
    it "should construct a new object" do
      entry = Diary.new("Today was awesome")
      expect(entry).to be
    end
  end

  context "#read method" do
    it "should returns the contents of the diary" do
      entry = Diary.new("Today was awesome")
      expect(entry.read).to eq "Today was awesome"
    end
  end
end