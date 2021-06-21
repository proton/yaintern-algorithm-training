lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
watched_tables = lines[1..m].map { |l| l.split.map(&:to_i) }
watched_students = watched_tables.flatten.uniq

p n - watched_students.size
