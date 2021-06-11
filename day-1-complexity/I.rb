a, b, c, d, e = 5.times.map { gets.to_i }

m1 = [a, b, c].min
m2 = a + b + c - m1 - [a, b, c].max

if [d, e].min >= m1 && [d, e].max >= m2
  puts 'YES'
else
  puts 'NO'
end
