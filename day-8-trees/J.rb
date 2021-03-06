class Tree
  attr_accessor :children, :value, :parent

  def initialize(value: nil)
    @value = value
    @children = []
  end

  def empty?
    value.nil?
  end

  def sub_children_count
    children.size + children.map(&:sub_children_count).reduce(0, :+)
  end

  def height
    cnt = 0
    node = self
    while node.parent
      cnt +=1
      node = node.parent
    end
    cnt
  end
end

lines = File.open('input.txt').readlines
n = lines[0].to_i
raw = lines[1..n].map { |s| s.split }

h = {}

raw.each do |(child, parent)|
  h[parent] ||= Tree.new(value: parent)
  parent_node = h[parent]
  h[child] ||= Tree.new(value: child)
  child_node = h[child]
  parent_node.children << child_node
  child_node.parent = parent_node
end

h.keys.sort.each do |key|
  node = h[key]
  puts "#{key} #{node.height}"
end