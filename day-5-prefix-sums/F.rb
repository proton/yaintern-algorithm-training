def calculate_power(powers, conditioners)
  cost = 0
  j = 0
  powers.each do |power|
    loop do
      conditioner_price, conditioner_power = conditioners[j]
      if conditioner_power >= power
        cost += conditioner_price
        break
      else
        j += 1
      end
    end
  end
  cost
end

lines = File.open('input.txt').readlines
n = lines[0].to_i
powers = lines[1].split.map(&:to_i).sort
m = lines[2].to_i
conditioners = lines[3..(3 + m)].map { |l| l.split.map(&:to_i).reverse }.sort

r = calculate_power(powers, conditioners)

puts r