# S/o to stackoverflow for helping me see how to return an enumerator object
# http://bit.ly/1NbaMwD

module Enumerable
  # DONE
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in self
      yield(i)
    end
    self
  end

  # DONE
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    0.upto(self.length-1) { |i| yield(self[i], i) }
    self
  end

  # DONE
  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    for i in self
      if yield(i)
        result << i
      end
    end
    result
  end

  # DONE
  def my_all?
    return true unless block_given?
    for i in self
      if !yield(i)
        return false
      end
    end
    true
  end

  # DONE
  def my_any?
    return true unless block_given?
    for i in self
      if yield(i)
        return true
      end
    end
    false
  end

  # DONE
  def my_none?
    return false unless block_given?
    for i in self
      if yield(i)
        return false
      end
    end
    true
  end

  # DONE
  def my_count
    self.length
  end

  def my_map
    result = []
    for i in self
      result << yield(i)
    end
    result
  end

  def my_inject

  end
end
test_hash = { a:1, b:2, c:3 }
test_arr = [1, 2, 3, 4]
test_arr.my_each{ |x| puts x  }
test_hash.my_each { |x| puts x }
test_arr.my_each_with_index { |x, i| puts "#{i}: #{x}" }
p test_arr.my_select { |x| x < 4 }
p test_arr.my_all? { |x| x.integer? }
p test_arr.my_all? { |x| x > 2 }
p test_arr.my_any? { |x| x.integer? }
p test_arr.my_any? { |x| x > 5 }
p test_arr.my_none? { |x| x > 5 } 
p test_arr.my_none? { |x| x.integer? }
