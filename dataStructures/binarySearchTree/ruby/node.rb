class BinarySearchTree < Struct.new(:parent, :left, :right, :data)
  def id
    return @id
  end
  def to_s
    return self.to_h.to_s
  end

  def to_h
    if self.left != nil && self.right != nil
      return { :id => self.object_id, :parent => self.parent, :left => self.left.to_h, :right => self.right.to_h, :data => self.data }
    elsif self.left == nil && self.right == nil
      return { :id => self.object_id, :parent => self.parent, :left => nil, :right => nil, :data => self.data }
    elsif self.left == nil
      return { :id => self.object_id, :parent => self.parent, :left => nil, :right => self.right.to_h, :data => self.data }
    else
      return { :id => self.object_id, :parent => self.parent, :left => self.left.to_h, :right => nil, :data => self.data }
    end
  end

  def add x
    if self.data == nil
      self.data = x
      return
    end
    if x < self.data
      if self.left == nil
        self.left = BinarySearchTree.new(self.object_id, nil, nil, x)
      else
        self.left.add(x)
      end
    elsif x > self.data
      if self.right == nil
        self.right = BinarySearchTree.new(self.object_id, nil, nil, x)
      else
        self.right.add(x)
      end
    end
  end

end

require 'json'
require 'yaml'

tree = BinarySearchTree.new()

tree.add 8
tree.add 9
tree.add 1
tree.add 100

json = tree.to_h.to_json
yaml = tree.to_h.to_yaml

print json.to_s
print yaml.to_s
