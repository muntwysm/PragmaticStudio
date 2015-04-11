=begin
def twice
  puts 'before yeild'
  yield(1)
  yield(2)
  'puts After yield'
end


twice do |number| puts "Running your Bloock! #{number}" end
=end

numbers = (1..10).to_a
#
#x_x = numbers.select do |x| x.even? end
#
#puts x_x


def my_select(array)
  results = []
  array.each do |element|
    results << element if yield (element)
  end
  results
end


puts my_select(numbers) { |x| x.even? }

# def compute
#   if block_given?
#     puts yield
#   else
#     puts puts 'Does not compute!'
#   end
# end

# compute do "hello" end
