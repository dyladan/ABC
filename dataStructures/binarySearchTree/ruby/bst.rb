class BinarySearchTree
  class Node < Struct.new(:left, :right, :data)
    def to_s
      return { :left => self.left.to_s, :right => self.right.to_s, :data => self.data.to_s }
    end

    def add x
      if x < self.data
        if self.left == nil
          self.left = Node.new(nil, nil, x)
        else
          self.left.add(x)
        end
      elsif x > self.data
        if self.right == nil
          self.right = Node.new(nil, nil, x)
        else
          self.right.add(x)
        end
      end
    end
  end

  def initialize(rootdata)
    @root = Node.new(nil, nil, rootdata)
  end

  def to_s
    hash = { :left => @root.left.to_s, :right => @root.right.to_s, :data => @root.data }
    return hash.to_s
  end

  def add x
    if x.class != @root.data.class
      print "error\n"
      return
    end

    @root.add(x)


  end

end

tree = BinarySearchTree.new(8)

tree.add 3
tree.add 6
tree.add 8
tree.add 3
tree.add 2

print tree.to_s
