lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
segments = lines[1..n].map { |l| l.split.map(&:to_i).sort }
dots = lines[n + 1].split.map(&:to_i)

events = []
segments.each do |s|
  events << [s.first, 0]
  events << [s.last, 2]
end
dots.each_with_index do |d, i|
  events << [d, 1, i]
end
events.sort!

r = []
cnt = 0
events.each do |event|
  if event[1] == 0
    cnt += 1
  elsif event[1] == 2
    cnt -= 1
  else
    i = event.last
    r[i] = cnt
  end
end

puts r.join(' ')