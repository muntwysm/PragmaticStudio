require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snackbar'

module Flicks
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
      save
    end


    def save(to_file='movie_rankings.csv')
      File.open(to_file,"w") do |file|
        @movies.sort.each do |movie|
          file.puts movie.to_csv
        end
      end
    end

    def load (from_file)
      File.readlines(from_file).each do |line|
        add_movie(Movie.from_csv(line))
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
        movie.each_snack do |snack|
          puts "#{snack.name} total #{snack.carbs} carbs"
        end
        puts "#{movie.title} grand total carbs consumed is #{movie.carbs_consumed}"
      end


      puts "\n#{name}'s Stats:"

      hits,flops = @movies.partition {|movie| movie.hit?}

      puts "\nHits :"
      puts hits.sort

      puts "\nFlops :"
      puts flops.sort
    end


  end
end
