

lines = File.open('input.txt').readlines
n = lines[0].to_i
powers = lines[1].split.map(&:to_i)
m = lines[2].to_i
conditioners = lines[3..(3 + m)].map { |l| l.split.map(&:to_i).reverse }.sort

p conditioners

r = powers.map do |power|
  conditioner = conditioners.bsearch { |(cost, c_power)| c_power >= power }
  p [power, conditioner]
  conditioner[0] # cost
end.sum

puts r