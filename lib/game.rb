class Game

  attr_reader :hp, :player_1, :player_2

    def initialize(player_1, player_2)
      @player_1 = player_1
      @player_2 = player_2
    end

    def show_players
      [@player_1, @player_2]
    end

    def attack(player_1, player_2)
     player_2.gets_attacked
    end
end
