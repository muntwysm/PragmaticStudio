def n_times n
  1.upto n do |number|
    yield(number)
  end
end

n_times(5) {|number| puts "Ho! #{number}"}
