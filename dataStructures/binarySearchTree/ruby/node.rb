class BinarySearchTree < Struct.new(:parent, :left, :right, :key, :data)
  def id
    return @id
  end
  def to_s
    return self.to_h.to_s
  end

  def to_h
    if self.left != nil && self.right != nil
      return { :id => self.object_id, :parent => self.parent, :left => self.left.to_h, :right => self.right.to_h, :key => self.key, :data => self.data }
    elsif self.left == nil && self.right == nil
      return { :id => self.object_id, :parent => self.parent, :left => nil, :right => nil, :key => self.key, :data => self.data }
    elsif self.left == nil
      return { :id => self.object_id, :parent => self.parent, :left => nil, :right => self.right.to_h, :key => self.key, :data => self.data }
    else
      return { :id => self.object_id, :parent => self.parent, :left => self.left.to_h, :right => nil, :key => self.key, :data => self.data }
    end
  end

  def add x, y
    if self.key == nil
      self.key = x
      self.data = y
      return
    end
    if self.key == x
      self.data = y
      return
    end
    if x < self.key
      if self.left == nil
        self.left = BinarySearchTree.new(self.object_id, nil, nil, x, y)
      else
        self.left.add(x, y)
      end
    elsif x > self.key
      if self.right == nil
        self.right = BinarySearchTree.new(self.object_id, nil, nil, x, y)
      else
        self.right.add(x, y)
      end
    end
  end

  def exists? key
    if self.key == nil
      return
    end
    if self.key == key
      return true
    end
    if self.left != nil && key < self.key
      return self.left.exists?(key)
    elsif self.right != nil
      return self.right.exists?(key)
    end
    if self.right == nil && self.left == nil
      return false
    end
  end

  def find key
    if self.key == nil
      return
    end
    if self.key == key
      return self
    end
    if self.left != nil && key < self.key
      return self.left.find(key)
    elsif self.right != nil
      return self.right.find(key)
    end

  end

end
require 'yaml'
start = Time.now

tree = BinarySearchTree.new()

(0..100000).each do |x|
  random = rand(100000)
  #tree.add(random, ('a'..'z').to_a.shuffle[0,8].join)
  tree.add(random, (0...8).map{(65+rand(26)).chr}.join)
end

middle = Time.now

print tree.find(100).data.to_s + "\n"

stop = Time.now

print tree.to_yaml

print "Time to populate tree: #{middle - start}\n"
print "Time to search tree: #{stop - middle}\n"
print "Total time: #{stop - start}\n"
