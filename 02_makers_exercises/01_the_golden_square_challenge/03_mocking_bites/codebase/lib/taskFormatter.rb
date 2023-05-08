class TaskFormatter
  def initialize(task)
    @task = task
  end

  def format
    return "[#{@task.complete? ? "x" : " "}] #{@task.title}" 
  end
end