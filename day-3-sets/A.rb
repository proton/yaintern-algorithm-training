require 'set'

l = gets.split.map(&:to_i)
s = Set.new(l)
puts s.size
