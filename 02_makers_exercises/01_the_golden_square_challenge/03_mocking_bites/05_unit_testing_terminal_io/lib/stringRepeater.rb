class StringRepeater
  def initialize(kernel)
    @io = kernel
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    str = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    num = @io.gets.chomp
    @io.puts "Here is your result:"
    return "#{str}" * num.to_i
  end
end