def bubble_sort(array)
  j = 0
  n = array.length-1
  loop do
    sorted = true
    for i in 0...n
      array[i], array[i+1], sorted = array[i+1], array[i], false if array[i] > array[i+1]
    end
    j += 1
    n -= 1
    if j == array.length-1 || sorted
      break
    end
  end
  return array
end

def bubble_sort_by(array)
  j = 0
  n = array.length-1
  loop do
    sorted = true
    for i in 0...n
      array[i], array[i+1], sorted = array[i+1], array[i], false if yield(array[i], array[i+1]) > 0
    end
    j += 1
    n -= 1
    if j == array.length-1 || sorted
      break
    end
  end
  return array
end
