

lines = File.open('input.txt').readlines
n = lines[0].to_i
powers = lines[1].split.map(&:to_i)
m = lines[2].to_i
conditioners = lines[3..(3 + m)].map { |l| l.split.map(&:to_i) }.sort

powers.map do |power|
  #
end