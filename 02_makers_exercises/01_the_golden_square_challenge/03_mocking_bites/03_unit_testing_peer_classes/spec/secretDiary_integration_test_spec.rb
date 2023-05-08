require "secretDiary"
require "diary"

describe "integration tests" do
  context "#initialize method" do
    it "should construct a new object" do
      entry = Diary.new("Today was awesome")
      secret_entry = SecretDiary.new(entry)
      expect(secret_entry).to be
    end
    it "should set locked variable, by default, to true" do
      entry = Diary.new("Today was awesome")
      secret_entry = SecretDiary.new(entry)
      expect(secret_entry.locked).to eq true
    end
  end

  context "#read method" do
    it "should throw the error 'Go Away!' when the diary is locked" do
      entry = Diary.new("Today was awesome")
      secret_entry = SecretDiary.new(entry)
      expect{ secret_entry.read }.to raise_error "Go Away!"
    end
    it "should read the diaries only when secretDiary is unlocked" do
      entry = Diary.new("Today was awesome")
      secret_entry = SecretDiary.new(entry)
      secret_entry.unlock
      expect(secret_entry.read).to eq ["Today was awesome"]
    end
  end

  context "#unlock method" do
    it "should unlock the secret diary" do
      entry = Diary.new("Today was awesome")
      secret_diary = SecretDiary.new(entry)
      secret_diary.unlock
      expect(secret_diary.locked).to eq false
    end
  end
  context "#lock method" do
    it "should lock the secret diary" do
      entry = Diary.new("Today was awesome")
      secret_diary = SecretDiary.new(entry)
      secret_diary.unlock
      secret_diary.lock
      expect(secret_diary.locked).to eq true
    end
  end
end