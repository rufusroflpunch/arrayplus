require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/arrayplus'
require_relative '../lib/arrayplus/to_s'

describe Array do

  before do
    @array = (1..12).to_a 
    @array2 = (1..3).to_a
    @array3 = ['h',3,1,1,0,' ','w',0,'r',1,'d']
  end

  describe "skipping every three elements" do
    it "will return a new array with three elements skipped" do
      @array.skip(3).must_equal [ 4, 8, 12 ]
    end
  end

  describe "skipping every three elements, starting after the first" do
    it "will return an array skipping three elements" do
        @array.alt_skip(3).must_equal [ 1, 5, 9 ]
    end
  end

  describe "adding all elements in the array" do
    it "will return the sum all elements" do
      @array.sum(1).must_equal (1 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12)
    end
  end

  describe "subtracting all elements in the array" do
    it "will return the argument minus all array element" do
      @array.subtract(100).must_equal (100 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - 11 - 12)
    end
  end

  describe "multiplying all elements in the array" do
    it "will return the argument multiplied by all array elements" do
      @array.multiply(5).must_equal (5 * 1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12)
    end
  end

  describe "padding a new elements inside the array" do
    it "will return an array with a new element between all elements" do
      @array2.pad(0,2).must_equal [ 0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, ]
    end
  end

  describe "padding new elements inside the array" do
    it "will modify itself with a new element between all elements" do
      @array2.pad!(0,2)
      @array2.must_equal [ 0, 0, 1, 0, 0, 2, 0, 0, 3, 0, 0, ]
    end
  end

  describe "overriding the builtin to_s method" do
    it "will return the array elements combined" do
      @array3.to_s.must_equal "h3110 w0r1d"
    end
  end
end
