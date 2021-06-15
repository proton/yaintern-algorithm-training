def count_cars(cars, k)
  t = Time.now
  cnt = 0

  prev_sum = nil
  prev_j = nil
  cars.each_index do |i|
    j = i
    sum = 0
    #els = []
    loop do
      sum += cars[j]
      #els << j
      if sum == k
        cnt += 1
        #p els
        prev_sum = sum
        prev_j = j
        break
      elsif sum > k
        prev_sum = sum
        prev_j = j
        break
      end
      j += 1
      if j == cars.size
        return cnt
        break
      end
    end
  end

  cnt
end

lines = File.open('input.txt').readlines
n, k = lines[0].split.map(&:to_i)
cars = lines[1].split.map(&:to_i)

r = count_cars(cars, k)
puts r