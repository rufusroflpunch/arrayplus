require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/arrayplus'

describe Array do

  before do
    @array = (1..12).to_a 
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

end
