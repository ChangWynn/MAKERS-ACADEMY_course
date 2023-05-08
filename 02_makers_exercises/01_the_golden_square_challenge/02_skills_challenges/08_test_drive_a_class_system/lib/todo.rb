class Todo

  attr_reader :task

  def initialize(task) # task is a string
    @task = task
  end

  def mark_done!(list)
    list.tasks[:incomplete].delete(self.task)
    list.tasks[:complete] << self.task
  end

  def done?(list)
    list.tasks[:complete].include?(self.task)
  end
end
