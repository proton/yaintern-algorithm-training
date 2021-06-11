troom, tcond = gets.split(' ').map(&:to_i)
mode = gets.strip
puts case mode
     when 'auto' then tcond
     when 'fan' then troom
     when 'freeze' then [troom, tcond].min
     when 'heat' then [troom, tcond].max
     end
