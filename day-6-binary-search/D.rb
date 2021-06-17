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

r1 = rbinsearch(0, 10**20) do |d|
  (w / (a + 2*d)) * (h / (b + 2*d)) >= n
end
r2 = rbinsearch(0, 10**20) do |d|
  (w / (b + 2*d)) * (h / (a + 2*d)) >= n
end

p [r1, r2].max