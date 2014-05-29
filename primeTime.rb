=begin

  Source:  Codewars
  Difficulty:  5 kyu
  Title:  (Ready for) Prime Time

  Description:
    We need prime numbers and we need them now!
    Write a method that takes a maximum bound and returns all
    primes starting with 0 up-to and including the maximum bound.

  Example:
    prime(11)  =>  [2,3,5,7,11]

=end



def prime(n)
  arr = (2..n).to_a
  arr.each { |i| arr.delete_if { |num| num % i == 0 and num != i} }
end