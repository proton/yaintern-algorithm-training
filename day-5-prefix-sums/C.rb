def build_height_changes(points)
  arr = Array.new(points.size, 0)
  points.each_with_index do |point, i|
    if i == 0
      arr[i] = point[1]
    else
      arr[i] = point[1] - points[i - 1][1]
    end
  end
  arr
end

def build_up_changes(changes)
  arr = Array.new(changes.size, 0)
  changes.each_with_index do |change, i|
    change = change > 0 ? change : 0
    if i == 0
      arr[i] = change
    else
      arr[i] = change + arr[i - 1]
    end
  end
  arr
end

def build_down_changes(changes)
  arr = Array.new(changes.size, 0)
  changes.each_with_index do |change, i|
    change = change < 0 ? change : 0
    if i == 0
      arr[i] = change
    else
      arr[i] = change + arr[i - 1]
    end
  end
  arr
end

def track_height((t_start, t_end), up_changes, down_changes)
  #p [t_start, t_end, up_changes]
  if t_end > t_start
    up_changes[t_end - 1] - up_changes[t_start - 1]
  elsif t_end == t_start
    0
  else
    down_changes[t_end - 1] - down_changes[t_start - 1]
  end
end

lines = File.open('input.txt').readlines
n = lines[0].to_i
points = lines[1..n].map { |l| l.split.map(&:to_i) }
m = lines[n + 1].to_i
tracks = lines[n+2..(n+m+1)].map { |l| l.split.map(&:to_i) }

height_changes = build_height_changes(points)
up_changes = build_up_changes(height_changes)
down_changes = build_down_changes(height_changes)

# p points
# p tracks
# p up_changes

r = tracks.map { |track| track_height(track, up_changes, down_changes) }
puts r