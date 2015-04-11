require_relative 'rankable'

class Movie

  include Rankable

  #attr_accessor: title,rank
  def initialize(title,rank=0)
    @rank = rank
    @title = title.capitalize
    @snack_carbs = Hash.new(0)
  end

  def each_snack
    @snack_carbs.each do |name,carbs|
      snack = Snack.new(name, carbs)
      yield(snack)
    end
  end

  def self.from_csv line
    title,rank = line.split(',')
    Movie.new(title,Integer(rank))
  end


  def to_csv
    "#{title},#{rank}"
  end

  def carbs_consumed
    @snack_carbs.values.reduce do |sum,value|
      sum += value
    end
  end




  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts  "#{title} led to #{snack.carbs} carbs of #{snack.name} being consumed!"
    puts "#{title}'s snacks: #{@snack_carbs}"
  end

  def to_s
    "#{@title} has a rank of #{@rank} and is a #{status}"
  end





  attr_accessor :title,:rank
end

if __FILE__ == $0

  movie_test = Movie.new('Transformers',5)
  puts movie_test.title

end
