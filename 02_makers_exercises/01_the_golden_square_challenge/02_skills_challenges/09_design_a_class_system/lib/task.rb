class Task
  def initialize(task)
    @task = task
  end

  def add(diary_object)
    diary_object.todo_list[:incomplete] << self 
  end

  def mark_done(diary_object)
    diary_object.todo_list[:incomplete].delete(self)
    diary_object.todo_list[:complete] << self
  end
end