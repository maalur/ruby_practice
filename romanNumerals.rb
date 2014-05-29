=begin

  Source:  Codewars
  Difficulty:  4 kyu
  Title:  RomanNumeralsEncoder

  Description:
    Create a function taking a positive integer as its parameter and returning
    a string containing the Roman Numeral representation of that integer.

    Modern Roman numerals are written by expressing each digit separately starting
    with the left most digit and skipping any digit with a value of zero.
    In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC.
    2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol in
    descending order: MDCLXVI.

  Example:
    roman_nums(1000) # should return 'M'

=end


ROMANS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
                L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }


# First solution
def roman_nums1(number)
  numerals = ''
  ROMANS.each do |key, val|
    div = number / val
    div.times { numerals += key.to_s }
    number -= (val * div)
  end
  numerals
end


# Second solution, practicing recursion. Less code but slower than the first solution.
def roman_nums2(number)
  return '' if number <= 0
  ROMANS.each { |key, val| return key.to_s + roman_nums2(number - val) if number >= val }
end

