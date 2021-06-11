def cnt_bigger_neighbours(l)
  cnt = 0
  l[1...-1].each_with_index do |e, i|
    cnt += 1 if e > l[i] && e > l[i+2]
  end
  cnt
end

l = gets.split.map(&:to_i)

puts cnt_bigger_neighbours(l)
