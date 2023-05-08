class Todo_list
  def initialize
    @tasks = []
  end

  def add_task(*task)
    raise ArgumentError unless task.all? { |task| task.is_a?(String) }
    return if task == [""]
    task.each{ |task| @tasks << task }
  end

  def print_tasks
    return @tasks
  end

  def mark_complete(task)
    raise "Task doesn't exist" unless @tasks.include?(task)
    @tasks.delete(task)
  end

end