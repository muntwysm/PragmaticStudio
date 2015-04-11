module Rankable
  def thumbs_up
    #puts "#{title} got a thumbs up!"
    self.rank += 1
  end
  def thumbs_down
    #puts "#{@title} got a thumbs down."
    self.rank -= 1
  end

  def normalizedRank
    @rank/10
  end

  def <=> (other)
    other.rank <=> rank
  end

  def hit?
    if self.rank == 10
      true
    end
  end

  def status
    hit? ? 'Hit!' : "Flop!"
  end

  def flop?
    if self.rank <= 10
      true
    end
  end

end
