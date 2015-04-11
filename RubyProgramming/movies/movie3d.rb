require_relative 'movie'

class Movie3D < Movie

  def initialize(title, rank, wow_factor)
    super(title,rank)
    @wow_factor = wow_factor
  end


  def show_effect
    puts "Wow!" * @wow_factor
  end

  def thumbs_up
    wow_factor = 10
    @wow_factor.times {super}
  end

  def intialize(wow_factor)
    super(title,rank)
    @wow_factor = wow_factor
  end


end

movie = Movie3D.new('glee', 5, 20)
puts movie.title


puts Movie3D.superclass
puts Movie3D.ancestors

movie.show_effect


movie.thumbs_up
puts movie.rank
