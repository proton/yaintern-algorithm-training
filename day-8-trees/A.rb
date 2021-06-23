TreeNode = Struct.new(:parent, :left, :right, :value) do
  def insert(node)
    if node.value == value
      # do nothing
    elsif node.value > value
      if right
        right.insert(node)
      else
        self.right = node
        node.parent = self
      end
    else
      if left
        left.insert(node)
      else
        self.left = node
        node.parent = self
      end
    end
  end

  def height
    1 + [(left ? left.height : 0), (right ? right.height : 0)].compact.max
  end
end

class Tree
  attr_reader :root

  def insert(value)
    node = TreeNode.new
    node.value = value
    if root
      root.insert(node)
    else
      @root = node
    end
  end

  def height
    root ? root.height : 0
  end
end

lines = File.open('input.txt').readlines
ns = lines[0].split.map(&:to_i)[0...-1]

t = Tree.new
ns.each do |n|
  t.insert(n)
end

# p t
p t.height