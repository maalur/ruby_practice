=begin

	Source:  Codewars
	Difficulty:  4 kyu
	Title:  Method Lockdown

	Description
		You're a kata author trying to prevent code warriors from using Ruby's
		built in random number generators because you want them to implement their own.

		Prevent the usage of random number generators by preventing calls to rand and
		srand in both the Kernel module and the Random class. Also prevent sneaky types
		from using sample and shuffle on arrays to get random numbers.

		The test will require calls to these methods to throw an error.

=end



class << Kernel
  undef rand
  undef srand
end

module Kernel
  undef rand
  undef srand
end

class Random
  undef rand
  undef srand rescue nil
end

class << Random
  undef rand
  undef srand
end

class Array
  undef sample
  undef shuffle
end