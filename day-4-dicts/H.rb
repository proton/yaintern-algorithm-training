class Counter < Hash
  def initialize
    super(0)
  end
  
  def inc(key)
    self[key] += 1
  end
  
  def dec(key)
    self[key] -= 1
    delete(key) if self[key] == 0
  end
end

def counter(word)
  h = Counter.new
  word.chars.each { |c| h[c] += 1 }
  h
end

def decrypt(word, letter_sequence)
  answer = 0
  return answer if word.size < letter_sequence.size
  
  letter_sequence_counter = counter(letter_sequence)
  word_counter = counter(word[0...(letter_sequence.size - 1)])
  
  ((letter_sequence.size - 1)...word.size).each do |index|
    # повыссить счетчик текущего
    word_counter.inc(word[index])
    answer += 1 if word_counter == letter_sequence_counter
    word_counter.dec(word[index - letter_sequence.size + 1])
  end
  
  return answer
end

gets
letter_sequence = gets.strip
word = gets.strip

puts decrypt(word, letter_sequence)
