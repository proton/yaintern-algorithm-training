a = gets.to_i
b = gets.to_i
c = gets.to_i

if c < 0
  puts 'NO SOLUTION'
elsif a == 0
  if b >= 0 && b == c**2
    puts 'MANY SOLUTION'
  else
    puts 'NO SOLUTION'
  end
else
  x = (c**2 - b) / a.to_f
  if x.ceil == x.floor
    puts x.to_i
  else
    puts 'NO SOLUTION'
  end
end
