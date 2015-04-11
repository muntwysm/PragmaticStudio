module Playable

  def blammed
    self.health -= 10
    puts "#{name} got blammed"
  end

  def w00ted
    self.health += 15
    puts "#{name} got w00ted"
  end

  def strong?
    health >= 100
  end

end
