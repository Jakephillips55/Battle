class Player
  attr_reader :name, :hp

  DEFAULT_HP = 110
  DMG = 10

  def initialize(name, hp = DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def attack(player)
    player.dmg
  end

  def dmg
    @hp -= DMG
  end

  def hp
    @hp
  end

end
