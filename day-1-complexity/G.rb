n, k, m = gets.split.map(&:to_i)
cnt = 0
nod = k / m
if m <= k
  while n / k > 0
    nob = n / k
    cnt += nob * nod
    n -= nod * m * nob
  end
end
puts cnt
