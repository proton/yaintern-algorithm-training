lines = File.open('input.txt').readlines

h = {}

lines.each do |line|
  user, product, cnt = line.split
  h[user] ||= Hash.new(0)
  h[user][product] += cnt.to_i
end

h.keys.sort.each do |user|
  puts "#{user}:"
  h[user].keys.sort.each do |product|
    puts "#{product} #{h[user][product]}"
  end
end
