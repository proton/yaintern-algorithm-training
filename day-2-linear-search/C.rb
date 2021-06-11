def closest(l, n)
  a = l[0]
  l[1..-1].each do |e|
    a = e if (e - n).abs < (a - n).abs 
  end
  a
end

gets
l = gets.split.map(&:to_i)
n = gets.to_i

puts closest(l, n)
