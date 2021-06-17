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
n, k = lines[0].split.map(&:to_i)
segments = lines[1..n].map(&:to_i)

l = rbinsearch(0, segments.max) do |l|
  segments.map { |s| s / l }.reduce(0, :+) >= 11
end

p l