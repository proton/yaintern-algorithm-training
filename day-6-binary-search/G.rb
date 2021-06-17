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
n = lines[0].to_i
m = lines[1].to_i
t = lines[2].to_i

m = rbinsearch(0, [n, m].min / 2) do |w|
  # p [2 * m * w + 2 * (n - 2*w) * w, t]
  2 * m * w + 2 * (n - 2*w) * w <= t
end

p m