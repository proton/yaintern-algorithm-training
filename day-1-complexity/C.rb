def format_phone(number)
  number = number.gsub(/[-\(\)]/, '').strip
  number = '+7495' + number if number.size == 7
  number = '+7' + number[1..-1] if number.size == 11
  number
end

init_number = format_phone(gets)
3.times do
  puts format_phone(gets) == init_number ? 'YES' : 'NO'
end
