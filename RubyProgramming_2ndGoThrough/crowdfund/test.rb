x = 1...10

x.each do |n|
  puts n

end


def variable_methods( a, *rest, last)
  x = *rest
  last_param = last
  x.each do |n|
    puts n
  end

  puts last_param
end

variable_methods('1',2,3,5)


def double(p1)
  yield(p1*2)
end


double(3) {|val| "I got #{val}" } # => "I got 6"
double( "tom" ) {|val| "Then I got #{val}" } # => "Then I got tomtom"


class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    " #@name on #{amount} = #{ @block.call(amount) }"
  end
end

tc = TaxCalculator.new( "Sales tax") {|amt| amt * 0.075 }
tc.get_tax(100) # => "Sales tax on 100 = 7.5"
tc.get_tax(250) # => "Sales tax on 250 = 18.75"


def search(field, genre: nil, duration: 120)
  p [field, genre, duration ]
end

search(:title)
search(:title, duration: 432)
search(:title, duration: 432, genre: "jazz" )

def search(field, genre: nil, duration: 120, **rest)
  p [field, genre, duration, rest ]
end

options = { duration: 432, stars: 3, genre: "jazz" , tempo: "slow" }
search(:title, options)
