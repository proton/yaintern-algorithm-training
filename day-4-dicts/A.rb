n = gets.to_i
h = {}

n.times.map do
  k, v = gets.strip.split
  h[k] = v
  h[v] = k
end

key = gets.strip
puts h[key]
