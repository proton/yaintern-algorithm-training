require 'set'

def has_more_than_one_stress(word)
  upper_count = 0
  word.scan(/[A-Z]/).size != 1
end

def validate(sentence, words)
  dict = {}
  words.each do |word|
    word_lower = word.downcase
    dict[word_lower] ||= Set.new
    dict[word_lower] << word
  end

  errors = 0

  sentence.split.each do |word|
    word_lower = word.downcase
     incorrect_stressing = dict[word_lower] && !dict[word_lower].include?(word)
     errors += 1 if incorrect_stressing || has_more_than_one_stress(word)
  end

  return errors
end

n = gets.to_i

words = n.times.map { gets.strip }
sentence = gets.strip

puts validate(sentence, words)