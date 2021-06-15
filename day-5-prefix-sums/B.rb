def count_cars(cars, k)
  t = Time.now
  cnt = 0

  prev_sum = nil
  prev_j = nil
  cars.each_index do |i|
    if prev_j
      j = prev_j
      sum = prev_sum - cars[i-1] - cars[j]
    else
      j = i
      sum = 0
    end
    loop do
      sum += cars[j]
      if sum == k
        cnt += 1
        prev_sum = sum
        prev_j = j
        break
      elsif sum > k
        prev_sum = sum
        prev_j = j
        break
      end
      j += 1

      return cnt if j == cars.size
    end
  end

  cnt
end

lines = File.open('input.txt').readlines
n, k = lines[0].split.map(&:to_i)
cars = lines[1].split.map(&:to_i)

r = count_cars(cars, k)
puts r