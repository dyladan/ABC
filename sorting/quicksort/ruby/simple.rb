def quicksort array
  if array.length <= 1
    return array
  end
  temp = array
  less = Array.new
  greater = Array.new

  pivot = temp.length/2
  pivotValue = temp[pivot]

  temp = temp[0..pivot-1] + temp[pivot+1..temp.length-1]

  temp.each do |x|
    if x <= pivotValue
      less.push x
    else
      greater.push x
    end
  end
  return quicksort(less).push(pivotValue) + quicksort(greater)
end

unsorted = [2,3,1,5,6,5,8,9,7,4,5,6,2,6,5,4,2,1]

print quicksort(unsorted).to_s + "\n"
