def find_match(n_colours, m_colours)
  i = j = 0
  best_i = i
  best_j = j
  best_diff = 1.0/0

  while i < n_colours.size && j < m_colours.size
    diff = (n_colours[i] - m_colours[j]).abs
    return [i, j] if diff == 0
    if diff < best_diff
      best_diff = diff
      best_i, best_j = i, j
    end

    if n_colours[i] <= m_colours[j]
      i += 1
    else
      j += 1
    end
  end
  [best_i, best_j]
end

lines = File.open('input.txt').readlines
n_colours = lines[1].split.map(&:to_i)
m_colours = lines[3].split.map(&:to_i)

i, j = find_match(n_colours, m_colours)
puts "#{n_colours[i]} #{m_colours[j]}"
