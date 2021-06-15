def count_cars(cars, k)
  cnt = 0

  cars.each_index do |i|
    j = i
    sum = 0
    els = []
    while i < cars.size && j < cars.size
      sum += cars[j]
      els << j
      if sum == k
        cnt += 1
        #p els
        break
      elsif sum > k
        break
      end
      j += 1
    end
  end

  cnt
end

lines = File.open('input.txt').readlines
n, k = lines[0].split.map(&:to_i)
cars = lines[1].split.map(&:to_i)

r = count_cars(cars, k)
puts r