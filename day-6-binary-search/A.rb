def lbinsearch(arr, &block)
  l = 0
  r = arr.size - 1
  while l < r
    m = (l + r) / 2
    if block[arr[m]]
      r = m
    else
      l = m + 1
    end
  end
  return arr[l]
end

lines = File.open('input.txt').readlines
ns = lines[1].split.map(&:to_i)
ks = lines[2].split.map(&:to_i)

ks.each do |k|
  x = lbinsearch(ns) { |n| n >= k }
  puts k == x ? 'YES' : 'NO'
end