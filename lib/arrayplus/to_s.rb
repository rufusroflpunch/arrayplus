class Array

  ###################
  # Overrides the built-in string method to return a combined string,
  # not a string representation of an array.
  #     require 'arrayplus/to_s'
  #     [1,2,3,'a'].to_s    # ==> "123a"

  def to_s
    return "" if self == []
    self.shift.to_s + self.to_s
  end
end
