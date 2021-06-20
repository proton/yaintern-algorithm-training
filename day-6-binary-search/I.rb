def rbinsearch(l, r, &block)
  while l < r
    m = (l + r + 1) / 2
    # p [__LINE__, m, block[m]]
    if block[m]
      l = m
    else
      r = m - 1
    end
  end
  return l
end

lines = File.open('input.txt').readlines
n, r, c = lines[0].split.map(&:to_i)
heights = lines[1..n].map(&:to_i).sort

p heights

# l = rbinsearch(0, segments.max) do |l|
#   # p [__LINE__, l, segments.map { |s| s / l }]
#   segments.map { |s| s / l }.reduce(0, :+) >= k
# end

# p l