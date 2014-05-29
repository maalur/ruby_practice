=begin

  Source:  Codewars
  Difficulty:  6 kyu
  Title:  Hyper Sphere

  Description:
    To pass this kata you are required to complete the function in_sphere?.
    You will be given an array of cordinates and a radius. The function should
    return true if the coordinates describe a point within the given radius of
    the origin ([0,0...0]). A point with no co-ordinates should return true.
    (In zero dimensions all points are the same point)

  Example:  
    in_sphere?([3, 4, 5], 6)  =>  false
    in_sphere?([0.5, 0.5, -0.5, -0.5, -0.5], 2)  =>  true

=end



def in_sphere?(coords, radius)
  coords.inject(0) {|sum, n| sum+ n**2} <= radius**2
end