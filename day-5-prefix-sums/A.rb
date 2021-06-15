def find_match(n_colours, m_colours)
  i = j = 0
  best_i = i
  best_j = j
  best_diff = 1.0/0
  prev_diff = 1.0/0

  while i < n_colours.size && j < m_colours.size
    diff = (n_colours[i] - m_colours[j]).abs
    return [i, j] if diff == 0
    if diff < best_diff
      best_diff = diff
      best_i, best_j = i, j
    end

    if diff <= prev_diff
      j += 1
      prev_diff = diff
    else
      i += 1
      j = best_j
      prev_diff = 1.0/0
    end
  end
  [best_i, best_j]
end


gets
n_colours = gets.split.map(&:to_i)
gets
m_colours = gets.split.map(&:to_i)

i, j = find_match(n_colours, m_colours)
puts "#{n_colours[i]} #{m_colours[j]}"
