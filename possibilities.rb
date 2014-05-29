=begin

  Source:  Codewars
  Difficulty:  4 kyu
  Title:  Life of Possibilities

  Description:
    Given a map of words and their translations, generate a list of
    all possible unique combinations of translations, sorted lexically.

  Example:
  	Given the map of words:

    	words = {
			  life:   %w{ vida vie Leben },
			  death:  %w{ muerte mort Tode }
			}

		The method should return the result:

		{
		  life: [
		    ['Leben'],
		    ['Leben', 'vida'],
		    ['Leben', 'vida', 'vie'],
		    ['Leben', 'vie'],
		    ['vida'],
		    ['vida', 'vie'],
		    ['vie']
		  ],
		  death: [
		    ['Tode'],
		    ['Tode', 'mort'],
		    ['Tode', 'mort', 'muerte'],
		    ['Tode', 'muerte'],
		    ['mort'],
		    ['mort', 'muerte'],
		    ['muerte']
		  ]
		}

=end



def possibilities(words)
  words.each do |k, v|
    res = []
    (1..(v.length)).each { |n| res << v.sort.combination(n).to_a }
    words[k] = res.flatten(1).sort
  end
  words
end