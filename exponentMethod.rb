=begin

  Source:  Codewars
  Difficulty:  5 kyu
  Title:  Exponent method

  Description:
    Create a method called "power" that takes two integers and returns
    the value of the first argument raised to the power of the second.
    Return nil if the second argument is negative.

    Note: The ** operator has been disabled.

  Example:
    power(2,3)  =>  8

=end


def power(base, exponent)
  (1..exponent).inject(1) { |n| n * base } unless exponent < 0
end