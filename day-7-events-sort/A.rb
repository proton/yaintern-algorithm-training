lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
watched_tables = lines[1..m].map { |l| l.split.map(&:to_i) }

#p [n, m]
p n - watched_tables.flatten.uniq.size
