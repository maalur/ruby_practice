=begin

	Source:  Codewars
	Difficulty:  5 kyu
	Title:  Custom Enumerators - Fibonacci

	Description:
		Ruby has very powerful enumerator support, including the ability to create your own custom enumerators on the fly.
		Create an enumerator "fib" that outputs successive fibonacci numbers.
		NOTE: The first value returned from the enumerator will be 1, not 0

	Example:
		fib.next  =>  1
		fib.next  =>  1
		fib.next  =>  2
		fib.next  =>  3

=end



fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y.yield b
    a, b = b, a + b
  end
end