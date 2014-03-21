##############
# Additional utility methods for the Ruby Array class.

class Array

  ################
  # This method returns a new array with 'num' elements skipped.
  #   [1, 2, 3, 4, 5, 6, 7].skip(2) # ==> [3, 6]

  def skip(num)
    new_arr = []
    self.each_slice(num + 1).to_a.each { |a| new_arr << a.drop(num) }
    return new_arr.flatten
  end

  ################
  # Returns a new array with 'num' elements skipped, starting after
  # the first element;
  #   [1, 2, 3, 4, 5, 6, 7].alt_skip(2) # ==> [1, 4, 7]

  def alt_skip(num)
    new_arr = []
    new_arr << self[0] << self.drop(1).skip(num)
    return new_arr.flatten
  end

  ################
  # Adds the values of all elements together, beginning with an
  # optional initial value.
  #   [1, 2, 3].sum(1) # ==> (1 + 1 + 2 + 3)

  def sum(initial=0)
    self.each { |i| initial += i } 
    return initial
  end

  ################
  # Subtracts the values of elements starting, beginning with an
  # optional initial value.
  #   [1, 2, 3].subtract(1) # ==> (1 - 1 - 2 - 3)

  def subtract(initial=0)
    self.each { |i| initial -= i }
    return initial
  end

  ################
  # Returns the product of all elements, beginning with an optional
  # initial value.
  #   [1, 2, 3].multiply(2) # ==> (2 * 1 * 2 * 3)

  def multiply(initial=0)
    self.each { |i| initial *= i }
    return initial
  end

  ################
  # Returns a new array, with new element 'padding' inserted between
  # all elements. 'num' represents the amount for each pad.
  #   [1, 2, 3].pad('a') # ==> ['a', 1, 'a', 2, 'a', 3, 'a']

  def pad(padding, num=1)
    new_arr = []
    self.each { |i| new_arr << [padding]*num << i }
    new_arr << [padding]*num
    return new_arr.flatten
  end

  #################
  # Same as #pad, but also modifies the original array

  def pad!(padding, num=1)
    new_arr = []
    self.each { |i| new_arr << [padding]*num << i }
    new_arr << [padding]*num
    self.replace new_arr.flatten
    return self
  end

end
