class SecretDiary

  attr_reader :locked

  def initialize(diary) # diary is an instance of Diary
    @diaries = []
    @diaries << diary
    @locked = true
  end

  def read
    raise "Go Away!" if @locked
    return @diaries.map(&:read)
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end