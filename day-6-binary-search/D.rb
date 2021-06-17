def rbinsearch(l, r, &block)
  while l < r
    m = (l + r + 1) / 2
    if block[m]
      l = m
    else
      r = m - 1
    end
  end
  return l
end

lines = File.open('input.txt').readlines
n, a, b, w, h = lines[0].split.map(&:to_i)

r = rbinsearch(0, 10**20) do |d|
  (w / (a + 2*d)) * (h / (b + 2*d)) >= n
end

p r