class Player

  attr_reader :name, :hp

  def initialize name
    @name = name
    @hp = 50
  end

  def attack(player)
  player.gets_attacked
end


  def gets_attacked
    @hp -= 10
  end
end
