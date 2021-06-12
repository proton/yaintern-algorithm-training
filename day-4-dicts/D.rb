lines = File.open('input.txt').readlines

max_presses = lines[1].split.each_with_index.map { |cnt, i| [i + 1, cnt.to_i] }.to_h

presses = Hash.new(0)
lines[3].split.each { |i| presses[i.to_i] += 1 }

max_presses.each do |key, max_cnt|
  puts max_cnt >= presses[key] ? 'NO' : 'YES'
end
