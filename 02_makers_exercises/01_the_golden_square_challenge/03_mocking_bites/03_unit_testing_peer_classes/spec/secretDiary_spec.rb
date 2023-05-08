require "secretDiary"

describe SecretDiary do
  context "#initialize method" do
    it "should construct a new object" do
      entry = double :Diary, contents: "CONTENTS"
      secret_entry = SecretDiary.new(entry)
      expect(entry).to be
      expect(secret_entry).to be
    end
    it "should set locked variable, by default, to true" do
      entry = double :Diary, contents: "CONTENTS"
      secret_entry = SecretDiary.new(entry)
      expect(secret_entry.locked).to eq true
    end
  end
  context "#read method" do
    it "should throw an error 'Go Away!' when the diary is locked" do
      entry = double :Diary, contents: "CONTENTS"
      secret_entry = SecretDiary.new(entry)
      expect { secret_entry.read }.to raise_error "Go Away!"
    end
    it "should read the diaries only when secretDiary is unlocked" do
      entry = double :Diary, read: "CONTENTS"
      secret_diary = SecretDiary.new(entry)
      secret_diary.unlock
      expect(secret_diary.read).to eq ["CONTENTS"]
    end
  end

  context "#unlock method" do
    it "should unlock the secret diary" do
      entry = double :Diary
      secret_diary = SecretDiary.new(entry)
      secret_diary.unlock
      expect(secret_diary.locked).to eq false
    end
  end
  context "#lock method" do
    it "should lock the secret diary" do
      entry = double :Diary
      secret_diary = SecretDiary.new(entry)
      secret_diary.unlock
      secret_diary.lock
      expect(secret_diary.locked).to eq true
    end
  end
end