sides = 3.times.map { gets.to_i }
c = sides.max
sides.delete_at(sides.index(c))
puts sides.sum > c ? 'YES' : 'NO'
