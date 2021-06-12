buttons = gets.split.map(&:to_i)
digits = gets.strip.chars.map(&:to_i)

puts (digits - buttons).uniq.size
