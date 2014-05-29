=begin

  Source:  Codewars
  Difficulty:  6 kyu
  Title:  Ruby Enumerator Methods - Part 1

  Description:
    Given the following dataset:

			data = [
			  {age: 40, sex: :m},
			  {age: 24, sex: :f},
			  {age: 56, sex: :m},
			  {age: 45, sex: :m},
			  {age: 23, sex: :f} 
			]

		Write a method that returns true if all of the items matching
		the sex value have ages greater than the value provided.

  Example:
    check_ages?(data, :f, 22)  =>  true
		check_ages?(data, :m, 50)  =>  false

=end



def check_ages?(data, sex, age)
  data.all? { |hash| hash[:sex] != sex || hash[:age] > age }
end