a, b, c, d, e = 5.times.map { gets.to_i }

d, e = [d, e].sort
a, b, c = [a, b, c].sort

if d >= a && e >= b
  puts 'YES'
else
  puts 'NO'
end
