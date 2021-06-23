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

    1 + [left_height, right_height].compact.max
  end

  def left_height
    left ? left.height : 0
  end

  def right_height
    right ? right.height : 0
  end

  def avl_balanced?
    (left_height - right_height).abs <= 1
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
      node.left.greatest
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

  def sorted_nodes
    r = []
    r += left.sorted_nodes if left
    r << self
    r += right.sorted_nodes if right
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
puts t.avl_balanced? ? 'YES' : 'NO'