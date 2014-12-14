require 'byebug'

class Array

  def my_each(&prc)
    i = 0
    while i < self.count
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_map(&prc)
    arr = []
    self.my_each do |element|
      arr << prc.call(element)
    end

    arr
  end

  def my_select(&prc)
    arr = []
    self.my_each do |el|
      arr << el if prc.call(el)
    end

    arr
  end

  def my_inject(&prc)
    # debugger
    sum = self[0]
    self.delete_at(0)

    self.my_each do |el|
      sum = prc.call(sum, el)
    end

    sum
  end

  def my_sort!(&prc)
    # debugger
    (0...self.length - 1).to_a.each do |first_number|
      (first_number + 1...self.length).to_a.each do |second_number|
        if prc.call(self[first_number], self[second_number]) == 1
          self[first_number], self[second_number] = self[second_number], self[first_number]
        end
      end
    end
    self
  end

  def my_sort(&prc)
    arr = self.dup
    arr.my_sort!(&prc)
  end
end

def eval_block(*args, &prc)
  prc.call(args)
end
