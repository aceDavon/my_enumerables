require_relative 'modules/my_enumerable'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  attr_reader :list

  def each
    yield @list
  end
end

tb = MyList.new(1, 2, 3, 4)
tb.list

tb.each { |num| puts num }
# 1
# 2
# 3
# 4

# Test #all? method
tb.all? { |e| e < 5 } # => true

tb.all? { |e| e > 5 } # => false

# Test #any? method
tb.any? { |e| e == 2 } # => true

tb.any? { |e| e == 5 } # => false

# Test #filter method
tb.filter(&:odd?) # => [1,3]

tb.filter(&:even?) # => [2,4]
