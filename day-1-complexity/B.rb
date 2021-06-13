sides = 3.times.map { gets.to_i }
c = sides.max
sides.delete_at(sides.index(c))
puts sides.reduce(0) { |a, b| a + b } > c ? 'YES' : 'NO'
