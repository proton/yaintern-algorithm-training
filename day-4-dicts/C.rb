h = Hash.new(0)

File.open('input.txt').read.split.each { |w| h[w] += 1 }

max_cnt = h.values.max # should be moved to each
puts h.select { |k, v| v == max_cnt }.keys.sort.first
