class Counter < Array
  def initialize(word)
    super(123 - 65, 0)
    word.chars.each { |c| self[c.ord - 65] += 1 }
  end
  
  def inc(char)
    self[char.ord - 65] += 1
  end
  
  def dec(char)
    self[char.ord - 65] -= 1
  end
end

def decrypt(word, letter_sequence)
  answer = 0
  return answer if word.size < letter_sequence.size
  
  letter_sequence_counter = Counter.new(letter_sequence)
  word_counter = Counter.new(word[0...(letter_sequence.size - 1)])
  
  ((letter_sequence.size - 1)...word.size).each do |index|
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
