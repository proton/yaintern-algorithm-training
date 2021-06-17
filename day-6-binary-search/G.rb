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
n = lines[0].to_i
m = lines[1].to_i
t = lines[2].to_i

m = rbinsearch(0, 10**20) do |w|
  #(m / x + m / y) >= n - 1
  
end + [x, y].min

p m