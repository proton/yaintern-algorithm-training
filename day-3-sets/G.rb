n = gets.to_i
turtles_words = n.times.map { gets.split.map(&:to_i) }
true_words = turtles_words
  .uniq # repeated ones - lies
  .select { |(before, after)| before >= 0 && after >= 0 && before + after == n -1 }
  
puts true_words.size
