# TODO: unfinished


def find_possible_results(l, winners)
  a = []
  l[1...-1].each_with_index do |e, i|
    a << e if e % 10 == 5 && winners.include?(l[0]) && l[i+2] < e
  end
  a
end

gets
results = gets.split.map(&:to_i).sort.reverse
winners = results[0...3]

possible_results = find_possible_results(results, winners)
result = possible_results.max

if result
  puts results.index(result)
else
  puts 0
end
