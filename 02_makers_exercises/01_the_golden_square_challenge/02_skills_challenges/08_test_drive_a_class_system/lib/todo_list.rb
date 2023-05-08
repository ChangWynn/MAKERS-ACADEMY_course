class TodoList
  attr_reader :tasks
  def initialize
    @tasks = { incomplete: [], complete: [] }
  end

  def add(todo)
    @tasks[:incomplete] << todo.task
  end

  def incomplete
    return @tasks[:incomplete]
  end

  def complete
    return @tasks[:complete]
  end

  def give_up!
    @tasks[:incomplete].each do |task|
      @tasks[:complete] << task
    end
    @tasks[:incomplete] = []
  end
end

