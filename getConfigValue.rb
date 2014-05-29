=begin

  Source:  Codewars
  Difficulty:  4 kyu
  Title:  Get config values of hash

  Description:
    Write a simple method for the Hash-class that can get the
    configuration-value from a JSON-interpreted hash. Its signature is:

			Hash.get_value( default, key1, ... )

		'key1, ...' refer to the hash-keys of the JSON-interpreted hash,
		which is a hash of hash values. If the path of keys is found,
		it should return the found value, else it should return the default value.

  Example:
    config = { :files => { :mode => 0x777 }, :name => "config" }

		config.get_value( 0x0, :files, :mode ) == 0x777
		config.get_value( "", :name ) == "config"
		config.get_value( 80, :port ) == 80
		config.get_value( "cfg", :files, :extension ) == "cfg"

=end



class Hash
  def get_value( default, *args )
    result = args.inject(self) { |temp, key| temp[key] if temp.is_a?(Hash) } if args.any?
    result || default
  end
end