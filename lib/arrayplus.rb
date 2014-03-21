class Array

  def skip(num)
    new_arr = []
    self.each_slice(num + 1).to_a.each { |a| new_arr << a.drop(num) }
    return new_arr.flatten
  end

  def alt_skip(num)
    new_arr = []
    new_arr << self[0] << self.drop(1).skip(num)
    return new_arr.flatten
  end

  def sum(initial=0)
    self.each { |i| initial += i } 
    return initial
  end

  def subtract(initial=0)
    self.each { |i| initial -= i }
    return initial
  end

  def multiply(initial=0)
    self.each { |i| initial *= i }
    return initial
  end

  def pad(padding, num=1)
    new_arr = []
    self.each { |i| new_arr << [padding]*num << i }
    new_arr << [padding]*num
    return new_arr.flatten
  end

  def pad!(padding, num=1)
    new_arr = []
    self.each { |i| new_arr << [padding]*num << i }
    new_arr << [padding]*num
    self.replace new_arr.flatten
    return self
  end

end
