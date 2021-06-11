def seq_type(l)
  eq = asc = dsc = false
  
  a = l[0]
  l[1..-1].each do |e|
    eq  = true if e == a
    asc = true if e > a
    dsc = true if e < a
    a = e
  end
  
  case true
  when asc && dsc then 'RANDOM'
  when eq && asc  then 'WEAKLY ASCENDING'
  when eq && dsc  then 'WEAKLY DESCENDING'
  when eq         then 'CONSTANT'
  when asc        then 'ASCENDING'
  when dsc        then 'DESCENDING'
  end
end
    
l = []
loop do
  n = gets.to_i
  break if n == -2000000000
  l << n
end

puts seq_type(l)
