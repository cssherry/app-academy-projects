def bubble_sort(number_array)
  running_counter = 0

  while running_counter < number_array.length
    number_array.each_with_index do |value, index|
      if index != number_array.length - 1 && value > number_array[index + 1]
        number_array[index], number_array[index + 1] = number_array[index + 1], number_array[index]
        #p number_array
      end
    end

    running_counter += 1
  end

  number_array
end

p bubble_sort([8, 3, 5, 2, 6, 1])


def bubble_sort(number_array)
  sorted = false

  until sorted
    sorted = true

    number_array.each_with_index do |value, index|
      if index != number_array.length - 1 && value > number_array[index + 1]
        number_array[index], number_array[index + 1] = number_array[index + 1], number_array[index]
        sorted = false
      end
    end
  end

  number_array
end
