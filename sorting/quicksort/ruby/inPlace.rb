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
