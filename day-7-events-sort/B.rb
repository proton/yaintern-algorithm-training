lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
segments = lines[1..n].map { |l| l.split.map(&:to_i) }
dots = lines[n + 1].split.map(&:to_i)

puts dots.map { |d| segments.count { |s| s.first <= d && s.last >= d } }.join(' ')