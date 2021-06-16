class Counter < Hash
  def initialize
    super(0)
  end
  
  def inc(key)
    self[key] += 1
  end
  
  def dec(char)
    self[key] -= 1
    delete(key) if self[key].zero?
  end
end

def find_len(colors, k)
  return k if k == 1 || k == colors.size

  min_length = 1.0/0
  best_ij = []


  (0..(colors.size - k)).each_with_index do |i| # не имеет смысла итерировать дальше size - k
    cnt = Counter.new
    color = colors[i]
    cnt[color] += 1

    j = i + 1
    loop do
      color = colors[j]
      cnt[color] += 1
      #p [__LINE__, i, j, cnt.size, min_length > j - i, min_length, j - i]
      if cnt.size == k && min_length > j - i
        min_length = j - i + 1
        best_ij = [i + 1, j + 1]
        break
      end
      j += 1
      if j == colors.size
        #p [__LINE__, cnt]
        return best_ij
      end
    end
  end
  
  best_ij
end

lines = File.open('input.txt').readlines
n, k = lines[0].split.map(&:to_i)
colors = lines[1].split.map(&:to_i)

r = find_len(colors, k)
puts r.join(' ')