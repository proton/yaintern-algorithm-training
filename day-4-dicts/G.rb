lines = File.open('input.txt').readlines

h = Hash.new(0)

lines.each do |line|
  a = line.split
  command = a[0]
  case command
  when 'DEPOSIT'
    h[a[1]] += a[2].to_i
  when 'WITHDRAW'
    h[a[1]] -= a[2].to_i
  when 'TRANSFER'
    h[a[1]] -= a[3].to_i
    h[a[2]] += a[3].to_i
  when 'BALANCE'
    puts h.include?(a[1]) ? h[a[1]] : 'ERROR'
  when 'INCOME'
    h.each do |k, v|
      h[k] = v * (100 + a[1].to_i) / 100
    end
  end
end
