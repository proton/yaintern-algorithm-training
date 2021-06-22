lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
# watched_tables = lines[1..m].map { |l| a, b = l.split.map(&:to_i).sort; (a..b).to_a }
# watched_tables = lines[1..m].map { |l| a, b = l.split.map(&:to_i).sort; (a..b) }.sort

events = []
lines[1..m].each do |l|
  a, b = l.split.map(&:to_i).sort
  events << [a, 0]
  events << [b, 1]
end
events.sort!

watched_students = 0
cnt = 0
s_start = s_end = 0
events.each do |event|
  d, type = event
  if type == 0
    cnt += 1
    s_start = d if cnt == 1
  else
    cnt -= 1
    if cnt == 0
      s_end = d
      watched_students += s_end - s_start + 1
    end
  end
end

#watched_students = watched_tables.flatten.uniq
# p watched_students
p n - watched_students