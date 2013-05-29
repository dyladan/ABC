def partition(array, left, right, pivotIndex)
  pivotValue = array[pivotIndex]
  array[pivotIndex] = array[right]
  array[right] = pivotValue
  storeIndex = left
  for i in array[left..right-1]i
    if array[i] <= pivotValue
      temp = array[i]
      array[i] = array[storeIndex]
      array[storeIndex] = temp
      storeIndex = storeIndex - 1
    end
  end
  temp = array[storeIndex]
  array[storeIndex] = array[right]
  array[right] = temp
  return storeIndex
end

def quicksort(array, left, right)i
  if left < right
    pivotIndex = rand(left..right)
    pivotNewIndex = partition(array, left, right, pivotIndex)
    quicksort(array, left, pivotNewIndex - 1)
    quicksort(array, pivotNewIndex + 1, right)
  end
end

array = [1,5,3,5,4,2,6,1,5,5]
quicksort(array, 0, 9)
