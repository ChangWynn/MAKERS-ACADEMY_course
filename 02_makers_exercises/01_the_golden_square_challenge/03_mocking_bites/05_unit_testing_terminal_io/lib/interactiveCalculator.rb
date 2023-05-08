class InteractiveCalculator
  def initialize(kernel)
    @io = kernel
  end

  def run
    @io.puts "Hello, I will subtract two numbers."
    @io.puts "Please enter a number"
    a = @io.gets.chomp
    @io.puts "Please enter another number"
    b = @io.gets.chomp
    @io.puts "Here is your result: "
    return "#{a} - #{b} = #{a.to_i - b.to_i}"
  end
end