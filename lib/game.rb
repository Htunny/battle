class Game

  attr_reader :hp, :player_1, :player_2, :turn

    def initialize(player_1, player_2)
      @player_1 = player_1
      @player_2 = player_2
      @turn = 0
    end

    def show_players
      [@player_1, @player_2]
    end

    def attack(player_1, player_2)
     @turn += 1
     player_2.gets_attacked
    end

    def even_move
      if @turn.even? 
        return true
      else
        return false
      end
    end
end
