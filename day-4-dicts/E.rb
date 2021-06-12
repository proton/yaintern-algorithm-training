lines = File.open('input.txt').readlines

n = lines[0].to_i
blocks = Hash.new(0)
lines[1..n].each do |line|
  width, height = line.split.map(&:to_i)
  blocks[width] = height if height > blocks[width]
end

puts blocks.values.reduce(0) {|a,b| a+b }
