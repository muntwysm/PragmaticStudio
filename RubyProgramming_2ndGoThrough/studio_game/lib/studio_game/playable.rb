module StudioGame

  module Playable

    def blam
      self.health = self.health - 10
      puts "#{@name} got blammed!"
    end

    def w00t
      self.health += 15
      puts "#{self.name} got w00ted!"
    end

    def strong?
      health > 100
    end


  end
end
