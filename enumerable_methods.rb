module Enumerable
  def my_each
    for i in 0...length do
      yield self.to_a[i]
    end
    return self
  end

  def my_each_with_index
    for i in 0...length do
      yield self.to_a[i] + [i]
    end
    return self
  end

  def my_select
    if self.kind_of?(Array)
      new_enum = []
      self.my_each {|e| new_enum << e if yield(e)}
    elsif self.kind_of?(Hash)
      new_enum = Hash.new
      self.my_each {|k, v| new_enum[k] = v if yield([k,v])}
    end
    return new_enum
  end

  def my_all?
    self.my_each {|e| return false if !yield(e)}
    return true
  end

  def my_any?
    self.my_each {|e| return true if yield(e)}
    return false
  end

  def my_none?(&block)
    !self.my_any?(&block)
  end

  def my_count(arg = nil)
    count = 0
    unless block_given?
      if arg
        self.my_each {|e| count += 1 if count == arg}
      else
        return self.length
      end
    else
      self.my_each {|e| count += 1 if yield(e)}
    end
    return count
  end

  def my_map(&bproc)
    new_enum = []
    self.each {|e| new_enum << bproc.call(e)}
    return new_enum
  end

  def my_inject(initial = 0, sym = nil)
    unless sym
      self.my_each {|e| initial = yield(initial, e)}
    else
      self.my_each {|e| initial = initial.method(sym).call(e)}
    end
    return initial
  end
end
