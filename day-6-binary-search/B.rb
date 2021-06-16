def find_closest(k, ns)
  i = ns.bsearch_index { |n| n >= k } || -1
  [ns[i], ns[i-1]].compact.sort_by { |x| [(x - k).abs, x] }.first
end

lines = File.open('input.txt').readlines
ns = lines[1].split.map(&:to_i)
ks = lines[2].split.map(&:to_i)

ks.each do |k|
  p find_closest(k, ns)
end