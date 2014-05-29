=begin

  Source:  interview challenge

  Description:
    Write a function called 'math_eval' that will evaluate a math problem in infix notation.
    You are not allowed to use the built in eval method.
    All math problems will have a format similar to: '1 + 2 - 3 / 4 * 5'

  Example:  math_eval('1 + 2 - 3 / 4 * 5')  =>  '-0.75'

=end



# solution 1, very quick and dirty, needs refactoring
def math_eval( str = nil, a = nil )
  a ||= str.split(" ")
  i = a.index( "/" ) || a.index( "*" ) || a.index( "-" ) || a.index( "+" )
  x, op, y = a[( i-1 )..( i+1 )]
  result = x.to_f.send( op, y.to_f )
  3.times { a.delete_at( i-1 ) }
  a.insert( i-1, result )
  a[1] ? math_eval(nil, a ) : a.join
end



# solution 2, refactored solution 1, still dirty, I wasn't happy with it
def math_eval2( str, a = nil )
  a ||= str.split(" ")
  i = (a.index( "/" ) || a.index( "*" ) || a.index( "-" ) || a.index( "+" )) - 1
  a[i, 0] = a.delete_at(i).to_f.send( a.delete_at(i), a.delete_at(i).to_f )
  a[1] ? math_eval2(nil, a ) : a.join
end



# final solution, much simpler and very fast
def math_eval3( str )
  op =  str.include?( " / " ) ? "\\/" :
        str.include?( " * " ) ? "\\*" :
        str.include?( " - " ) ? "\\-" :
        str.include?( " + " ) ? "\\+" :
        nil
  str.sub!(/([-.0-9e]+) (#{op}) ([-.0-9e]+)/) { $1.to_f.send($2, $3.to_f).to_s } ? math_eval3(str) : str
end