a, b = File.open('input.txt').readlines.map { |l| l.split.map(&:to_i) }

File.open('output.txt', 'w') { |f| f.write (a & b).sort.join(' ') }
