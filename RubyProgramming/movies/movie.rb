class Movie
  #attr_accessor: title,rank
  def initialize(title,rank=0)
    @rank = rank
    @title = title.capitalize
    @snack_carbs = Hash.new(0)
  end


  def carbs_consumed
    @snack_carbs.values.reduce do |sum,value|
      sum += value
    end
  end

  def <=> (other_movie)
    other_movie.rank <=> rank
  end

  def normalizedRank
    @rank/10
  end

  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts  "#{title} led to #{snack.carbs} carbs of #{snack.name} being consumed!"
    puts "#{title}'s snacks: #{@snack_carbs}"
  end

  def to_s
    "#{@title} has a rank of #{@rank} and is a #{status}"
  end

  def thumbs_up
    puts "#{title} got a thumbs up!"
    @rank += 1
  end

  def thumbs_down
    puts "#{@title} got a thumbs down."
    @rank -= 1
  end

  def hit?
    if @rank == 10
      true
    end
  end

  def status
    hit? ? 'Hit!' : "Flop!"
  end


  def flop?
    if @rank <= 10
      true
    end
  end

  attr_reader :rank
  attr_accessor :title
end

if __FILE__ == $0

  movie_test = Movie.new('Transformers',5)
  puts movie_test.title

end
