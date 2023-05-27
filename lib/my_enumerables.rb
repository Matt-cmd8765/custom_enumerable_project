module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      until i == self.length
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    if block_given?
      arrg = []
      self.my_each { |num| arrg << num if yield(num) }
      arrg
    end
  end

  def my_all?
    if block_given?
      result = true
      self.my_each { |num| result = false if yield(num) }
      result
    end
  end

  def my_any?
    if block_given?
      result = false
      self.my_each { |num| result = true if yield(num) }
      result
    end
  end

  def my_count
    if block_given?
      count = 0
      self.my_each { |num| count += 1 if yield(num) }
    end
    if count.nil?
      self.size
    else
      count
    end
  end

  def my_inject(number)
    if block_given?
      self.my_each { |num| number = yield(num, number) }
    end
    number
  end

  def my_map
    if block_given?
      arrg = []
      self.my_each { |num| arrg << yield(num) }
    end
    arrg
  end

  def my_none?
    if block_given?
      result = true
      self.my_each { |num| result = false if yield(num) }
      result
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  include Enumerable
  def my_each
    length.times { |i| yield self[i] } if block_given?
    self
  end
end