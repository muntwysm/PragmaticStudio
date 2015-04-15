module MyEnumerable
  def my_map
    new_array = []
    each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_select
    new_array = []
    each do |value|
      new_array << value if yield(value)
    end
    new_array
  end

  def my_reject
    new_array = []
    each do |value|
      unless yield(value)
        new_array << value
      end
    end
    new_array
  end


  def my_detect
    new_array = []
    each do |value|
      if yield(value)
        return value
      end
    end
  end


  def my_reduce(inital_value)
    sum = inital_value
    each do |value|
      sum = yield(sum,value)
    end
    sum
  end


  def my_any?
    each do |value|
      return true if yield(value)
    end
  end
end
