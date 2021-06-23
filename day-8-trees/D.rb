class Tree
  attr_accessor :parent, :left, :right, :value

  def initialize(value: nil)
    @value = value
  end

  def empty?
    value.nil?
  end

  def insert(value)
    if empty?
      self.value = value
      return
    end

    node = Tree.new(value: value)
    insert_node(node)
  end

  def insert_node(node)
    if node.value == value
      # do nothing
    elsif node.value > value
      if right
        right.insert_node(node)
      else
        self.right = node
        node.parent = self
      end
    else
      if left
        left.insert_node(node)
      else
        self.left = node
        node.parent = self
      end
    end
  end

  def height
    return 0 if empty?

    1 + [(left ? left.height : 0), (right ? right.height : 0)].compact.max
  end

  def greatest
    return if empty?

    right ? right.greatest : value
  end

  def second_greatest
    return if empty?

    node = self
    node = node.right while node.right

    if node.left
      node.left.value
    elsif node.parent
      node.parent.value
    end
  end

  def sorted_values
    r = []
    r += left.sorted_values if left
    r << self.value
    r += right.sorted_values if right
    r
  end
end

lines = File.open('input.txt').readlines
ns = lines[0].split.map(&:to_i)[0...-1]

t = Tree.new
ns.each do |n|
  t.insert(n)
end

# p t
puts t.sorted_values