require 'set'

def parse_genom(str)
  str.strip.each_char.each_cons(2).map(&:join)
end

genom1 = parse_genom(gets)
genom2 = Set.new(parse_genom(gets))

puts genom1.select { |gene| genom2.include? gene }.size
