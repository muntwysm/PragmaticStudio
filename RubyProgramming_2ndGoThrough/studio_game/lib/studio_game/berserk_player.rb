require_relative 'player'
module StudioGame
  class BerserkPlayer < Player

    attr_accessor  :w00t_count

    def initialize(name, health=100)
      super(name, health)
      @w00t_count = 0
    end

    def w00t
      super
      @w00t_count += 1
      puts "#{name} is berserk!" if berserk?
    end

    def blam
      if berserk?
        puts "#{name} has gone berserk, blamming him w00ts him instead!"
        self.w00t
      else
        super
      end
    end


    def berserk?
      @w00t_count > 5
    end

  end

  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
    2.times { berserker.blam }
    puts berserker.health
  end
end
