n = gets.to_i
student_langs = Hash.new(0)

n.times.map do
  k = gets.to_i
  k.times.each do
    student_langs[gets.strip] += 1
  end
end

everyone_knows = student_langs.select { |k,v| v == n }.keys
someone_knows = student_langs.keys

puts everyone_knows.size
puts everyone_knows
puts someone_knows.size
puts someone_knows
