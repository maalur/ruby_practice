=begin

  Source:  Codewars
  Difficulty:  6 kyu
  Title:  Simple Sentences

  Description:
    Implement a function, so it will produce a sentence out of the given parts.

		Array of parts could contain:
			- words;
			- commas in the middle;
			- multiple periods at the end.

		Sentence making rules:
			- there must always be a space between words;
			- there must not be a space between a comma and word on the left;
			- there must always be one and only one period at the end of a sentence.

  Example:
    make_sentence(['hello', ',', 'my', 'dear'])  =>  'hello, my dear.'

=end



def make_sentence parts
  parts.join(' ').gsub(/\s,/, ',' ).sub(/[\s\.]*$/, '.')
end