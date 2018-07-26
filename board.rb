require_relative 'tile'
require 'byebug'

class Board
  def initialize(size)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
  end
  attr_accessor :grid, :size

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def render
    grid.each do |row|
      puts row.join(' ')
    end
  end

  def populate(num = @size)
    num.times do
      place_random_bomb
    end
    grid.each do |row|
      row.each_index do |idx|
        if row[idx] == nil
          row[idx] = Tile.new
        else
          next
        end
      end
    end
  end

  def place_random_bomb
    bomb = Tile.make_bomb
    x = (0...size).to_a.sample
    y = (0...size).to_a.sample
    if self[[x,y]] == nil
      self[[x,y]] = bomb
    else
      place_random_bomb
    end
  end



end
