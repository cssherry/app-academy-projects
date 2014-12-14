class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(value)
    stack << value
  end

  def inspect
    p stack
  end

  def is_empty?
    raise "No values" if stack.length == 0
    raise "You need a second value" if stack.length == 1
  end

  def add
    is_empty?
    stack.push(stack.pop + stack.pop)
  end

  def minus
    is_empty?
    subtrahend, minuend = stack.pop, stack.pop
    stack.push(minuend - subtrahend)
  end

  def divide
    is_empty?
    divisor, dividend = stack.pop, stack.pop
    stack.push(dividend, divisor)
  end

  def times
    is_empty?
    stack.push(stack.pop * stack.pop)
  end

  def tokens(string)
    string.split.map { |elem| elem =~ (/\d+/) ? elem.to_i : elem.to_sym }
  end

  def evaluate(string)
    symbols = Hash[:+, 'add', :-, "minus", :*, 'times', :/, 'divide']
    stack_array = tokens(string)
    stack_array.each do |elem|
      elem.is_a?(Fixnum) ? stack.push(elem) : self.send(symbols[elem])
    end

    stack.last
  end

end

evaluation = File.read(ARGV[0])
calc = RPNCalculator.new
p calc.evaluate(evaluation)

=begin
# To run the file from the command line
if __FILE__ == $PROGRAM_NAME
  p "Please enter your RPN string"
  evaluation = gets
  calc = RPNCalculator.new
  p calc.evaluate(evaluation)
=end
