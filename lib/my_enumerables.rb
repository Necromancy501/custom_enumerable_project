module Enumerable
  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true  
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count
    index = 0
    block_given? ? my_each {|element| index+=1 if yield(element)} : my_each {|element| index+=1}
    index
  end

  def my_each_with_index
    index=0
    my_each do |element|
      yield(element, index)
      index+=1
    end
    self
  end

  def my_map
    my_each_with_index do |element, index|
      self[index] = yield(element)
    end
  end

  def my_none? 
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_select
    result = []
    my_each do |element|
      result.push(element) if yield element
    end
    result
  end

  def my_inject initial_value
    my_each_with_index do |element, index|
      initial_value = yield initial_value, element
    end
    initial_value

  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    length = self.length
    index = 0
    length.times do
      yield self[index]
      index+=1
    end
    self
  end
end
