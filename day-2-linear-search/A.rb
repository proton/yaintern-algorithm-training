def growth?(l)
  a = l[0]
  l[1..-1].each do |e|
    return false unless e > a
    a = e
  end
  true
end


l = gets.split.map(&:to_i)
puts growth?(l) ? 'YES' : 'NO'
