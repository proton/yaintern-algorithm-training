def lbinsearch(l, r, &block)
  while l < r
    m = (l + r) / 2
    if block[m]
      r = m
    else
      l = m + 1
    end
  end
  return l
end

lines = File.open('input.txt').readlines
n, x, y = lines[0].split.map(&:to_i)

m = lbinsearch(0, n * [x, y].max) do |m|
  (m / x + m / y) >= n - 1
end + [x, y].min

p m