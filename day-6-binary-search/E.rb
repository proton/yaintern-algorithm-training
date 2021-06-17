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
a = lines[0].to_i # 2
b = lines[1].to_i # 3
c = lines[2].to_i # 4
# d = ??? # 5
d = lbinsearch(0, 10**21) do |d|
  2 * (a * 2 + b * 3 + c * 4 + d * 5) >= 7 * (a + b + c + d)
end

p d