# find all combinations of two nums with diff > r
def find_cnt(nums, r)
  cnt = 0
  j = 1
  nums.each_with_index do |num, i|
    while j < nums.size
      num2 = nums[j]
      if num2 - num > r
        cnt += nums.size - j
        break
      end
      j += 1
    end
  end
  cnt
end

lines = File.open('input.txt').readlines
n, r = lines[0].split.map(&:to_i)
ds = lines[1].split.map(&:to_i)

r = find_cnt(ds, r)
puts r