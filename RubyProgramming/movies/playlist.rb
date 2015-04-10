require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snackbar'

class Playlist

  attr_reader :name


  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    puts "#{@name}'s playlist:"

    puts @movies.sort

    snacks = SnackBar::SNACKS

    "\n There are #{snacks.size} in the snacks bar."
    snacks.each do |snack|
      puts "#{snack.name} #{snack.carbs} carbs"
    end

    1.upto(viewings) do |count|
      puts "\nViewing #{count}"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        snack = SnackBar.random
        movie.ate_snack(snack)
        puts movie
      end

      print_stats
    end
  end




  def total_carbs_consumed
    @movies.reduce(0) do |sum,movie|
      sum + movie.carbs_consumed
    end
  end


  def print_stats

    puts "Total Carbs Consumed: #{total_carbs_consumed}"

    puts "\n Carbs Consumed Per Movie \n"

    @movies.sort.each do |movie|
      puts "#{movie.title} total carbs consumed is #{movie.carbs_consumed}"
    end


    puts "\n#{name}'s Stats:"

    hits,flops = @movies.partition {|movie| movie.hit?}

    puts "\nHits :"
    puts hits.sort

    puts "\nFlops :"
    puts flops.sort
  end


end
