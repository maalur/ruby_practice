=begin

  Source:  Codewars
  Difficulty:  4 kyu
  Title:  Matrix Determinant

  Description:
    Write a function that accepts a square matrix (n x n 2D array) and returns the determinant of the matrix.

  Example:  determinant( [[1,2], [3,4]] )  =>  -2

=end



def determinant(matrix)
  n = matrix.length
  det = 0
  
  case n
    when 0
      det = 1
    when 1
      det = matrix[0][0]
    when 2
      det = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
    else
      (0...n).each do |i|
      	sign = (-1) ** i
	      arr = Marshal.load( Marshal.dump(matrix) )
	      arr.delete_at(0)
	      arr.each { |row| row.delete_at(i) }
	      det += sign * matrix[0][i] * determinant(arr)
	    end
  end
  det
end