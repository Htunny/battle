class Player

  attr_reader :name, :hp

  STARTING_HP = 50

  def initialize name
    @name = name
    @hp = 50
  end

  def gets_attacked
    @hp -= 10
  end
end
