require_relative 'player'

class BeserkPlayer < Player

  def initialize(name, health=100)
    super(name, health)
    @times_wooted = 0
  end

  def w00ted
    @times_wooted += 1
    puts "i've been wooted this many times #{@times_wooted}"
    super
  end

  def beserk?
    @times_wooted >= 5
  end

  def blammed
    if beserk?
      puts "#{name} has gone beserk so blamming woots him instead!"
      w00ted
    else
      super
    end
  end



end
