# TODO: my own search

lines = File.open('input.txt').readlines
ns = lines[1].split.map(&:to_i)
ks = lines[2].split.map(&:to_i)

ks.each do |k|
  x = ns.bsearch { |n| n >= k }
  puts k == x ? 'YES' : 'NO'
end