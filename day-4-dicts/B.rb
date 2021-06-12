h = Hash.new(0)

words = File.open('input.txt').read.split #(/[\s\.]+/)

cnts = words.map do |word|
  h[word] += 1
  h[word] - 1
end

puts cnts.join(' ')
