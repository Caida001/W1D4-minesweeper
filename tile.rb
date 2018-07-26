class Tile
  attr_reader :val
  def initialize(bomb = false)
    @bomb = bomb
    @revealed = false
    @val = nil
  end

  def self.make_bomb
    Tile.new(true)
  end

  def reveal
    @revealed = true
  end

  def set_val(num)
    @val = num
  end

  def revealed?
    @revealed
  end

  def is_bomb?
    @bomb
  end 
end
