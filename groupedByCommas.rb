=begin
  
  Source:  Codewars
  Difficulty:  6 kyu
  Title:  Grouped by commas

  Description:
    Finish the solution so that it takes an input 'n' (integer) and returns a string
    that is the decimal representation of the number grouped by commas after every 3 digits.

  Example:  solution(1000000)  =>  '1,000,000'
    
=end


def solution(n)
  n.to_s.reverse.scan(/\d{1,3}/).join(',').reverse
end