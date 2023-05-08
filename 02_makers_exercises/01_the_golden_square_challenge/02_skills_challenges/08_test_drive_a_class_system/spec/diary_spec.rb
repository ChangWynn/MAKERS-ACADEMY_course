require "diary"

describe Diary do
  it "creates a new instance of Diary" do
    diary = Diary.new
    expect(!!diary).to eq true
  end
end