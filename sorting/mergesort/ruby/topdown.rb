def mergesort array
  length = array.length
  if length <= 1
    return array
  end

  middle = length/2
  left = Array.new
  right = Array.new

  array[0..middle].each do |x|
    left.push x
  end
  array[middle+1..length-1].each do |x|
    right.push x
  end

  left = mergesort left
  right = mergesort right

  return merge(left, right)
end

def merge(left, right)
  result = Array.new
  while left.length > 0 || right.length > 0
    if left.length > 0 && right.length > 0
      if left[0] <= right[0]
        result.push left[0]
        left = left[1..left.length-1]
      else
        result.push right[0]
        right = right[1..right.length-1]
      end
    elseif left.length > 0
      result.push left[0]
      left = left[1..left.length-1]
    elseif right.length > 0
      result.push right[0]
      right = right[1..right.length-1]
    end
  end
  return result
end


array = [2,3,1,5,3,1,2,2,1]

print mergesort(array).to_s + "\n"
