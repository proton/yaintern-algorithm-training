def find_substring(k, str)
  cnt = Array.new(26, 0) # -a.ord == 97

  left, right, sub_right, sub_left = 0, 0, 0, 0
  while right < str.size
    charcode = str[right].ord - 97
    if cnt[charcode] < k
      if right - left > sub_right - sub_left
        sub_right, sub_left = right, left
      end
      cnt[charcode] += 1
      right += 1
    else
      left = right - k + 1
      cnt = Array.new(26, 0)
    end
  end

  return [sub_right - sub_left + 1, sub_left + 1]
end

lines = File.open('input.txt').readlines
n, k = lines[0].split.map(&:to_i)
str = lines[1].strip

r = find_substring(k, str)
puts r.join(' ')