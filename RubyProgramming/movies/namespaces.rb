module MovieSystem
  VERSION = 1.0

  def self.info
    puts "movie system version #{VERSION}"
  end

  class Player
  end
end

module GameSystem
  VERSION = 1.0

  def self.info
    puts "game system version #{VERSION}"
  end

  class Player
  end
end



puts MovieSystem.info
puts MovieSystem::VERSION

game_player = GameSystem::Player.new
puts game_player
