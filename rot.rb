=begin
  
  Source:  interview challenege

  Description:
    The rot13() function encrypts a string by rotating the letters around the alphabet by 13.
    rot13('ABCD') outputs 'NOPQ'

    Write a rotation encryption function called 'rotx' that returns a string encrypted by rotating the letters x places around the alphabet.
    The function should have 3 input parameters:
      x:  the number to rotate by
      string:  the input string
      encrypt:  defaulted to true, when false it should decrypt an encrypted string with the same rotation

  Example:
    rotx(5, 'Hello world')  =>  'Mjqqt btwqi'
    rotx(5, 'Mjqqt btwqi', false)  =>  'Hello world'
    
=end



# first solution, could use some refactoring
def rotx1(x, string, encrypt=true)

  return string if x % 26 == 0
  offset = encrypt ? x % 26 : -x % 26

  return string.tr('A-Za-z', 'B-ZAb-za') if offset == 1
  return string.tr('A-Za-z', "ZA-Yza-y") if offset == 25
  rot_a = (offset + 'a'.ord).chr
  rot_z = (rot_a.ord - 1).chr
  
  string.tr('A-Za-z', rot_a.upcase + "-ZA-" + rot_z.upcase + rot_a + "-za-" + rot_z)
end



# second solution, refactored the first solution and created a helper function to get the rotated translation string
def rotx2(x, string, encrypt=true)
  offset = encrypt ? x % 26 : -x % 26
  rot_a = (offset + 'a'.ord).chr
  rot_z = (rot_a.ord - 1).chr

  string.tr('A-Za-z', rotated_alph(offset, rot_a, rot_z))
end

def rotated_alph(offset, rot_a, rot_z)
  case offset
    when 0
      "A-Za-z"
    when 1
      "B-ZAb-za"
    when 25
      "ZA-Yza-y"
    else
      rot_a.upcase + "-ZA-" + rot_z.upcase + rot_a + "-za-" + rot_z
  end
end
