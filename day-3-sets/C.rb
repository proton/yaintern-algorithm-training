n, m = gets.split.map(&:to_i)
n_colors = n.times.map { gets.to_i }
m_colors = m.times.map { gets.to_i }

common_colors = n_colors & m_colors
n_colors -= common_colors
m_colors -= common_colors

[common_colors, n_colors, m_colors].each do |colors|
  puts colors.size
  puts colors.sort.join(' ')
end
