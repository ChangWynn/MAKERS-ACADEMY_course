require "diary"

describe Diary do
  it "should create a new instance of Diary" do
    diary = Diary.new
    expect(diary).to eq diary
  end
end