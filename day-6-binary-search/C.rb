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
w, h, n = lines[0].split.map(&:to_i)

r = lbinsearch(0, 10**10) do |x|
  (x / w) * (x / h) >= n
end

p r