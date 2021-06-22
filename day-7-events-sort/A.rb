lines = File.open('input.txt').readlines
n, m = lines[0].split.map(&:to_i)
watched_tables = lines[1..m].map { |l| a, b = l.split.map(&:to_i).sort; (a..b).to_a }


watched_students = watched_tables.flatten.uniq

p n - watched_students.size


# Решившие 7 A, подскажите пожалуйста ответ в 7ом тесте (входные данные https://pastebin.com/XGjFAacy)

# 1000 учеников, преподаватели смотрят на 877 уникальных парт, 1000 - 877 = 123, но боту мой ответ не нравится :(