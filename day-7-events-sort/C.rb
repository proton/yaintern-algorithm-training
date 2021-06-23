lines = File.open('input.txt').readlines
n, d = lines[0].split.map(&:to_i)
xs = lines[1].split.map.with_index { |pos, i| [pos.to_i, i] }.sort

xs.each_with_index do |x, i|
  if i == 0
    x[2] = current_var
  elsif x[0] > xs[i-1][0] + d
    current_var = 1
    x[2] = current_var
  else
    # while diff < d
  end
  r[x[1]] = x[2]
end
p xs

# events = []
# segments.each do |s|
#   events << [s.first, 0]
#   events << [s.last, 2]
# end
# dots.each_with_index do |d, i|
#   events << [d, 1, i]
# end
# events.sort!

# r = []
# cnt = 0
# events.each do |event|
#   if event[1] == 0
#     cnt += 1
#   elsif event[1] == 2
#     cnt -= 1
#   else
#     i = event.last
#     r[i] = cnt
#   end
# end

# puts r.join(' ')