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

end
