class Counter < Hash
  def initialize
    super(0)
  end
  
  def inc(key)
    self[key] += 1
  end
  
  def dec(key)
    self[key] -= 1
    delete(key) if self[key].zero?
  end
end

def find_len(colors, k)
  return [1, k] if k == 1 || k == colors.size

  min_length = 1.0/0
  best_ij = []
  prev_j = nil

  cnt = Counter.new
  (0..(colors.size - k)).each_with_index do |i|
    if prev_j
      j = prev_j
      color = colors[i - 1]
      cnt.dec(color)
      color = colors[j]
      cnt.dec(color)
    else
      cnt = Counter.new
      color = colors[i]
      cnt.inc(color)
      j = i + 1
    end
    loop do
      prev_j = j
      color = colors[j]
      cnt.inc(color)
      if cnt.size == k
        if min_length > j - i
          min_length = j - i
          best_ij = [i + 1, j + 1]
        end
        break
      end
      j += 1
      if j == colors.size
        return best_ij if cnt.size < k
        prev_j = j - 1
        break
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