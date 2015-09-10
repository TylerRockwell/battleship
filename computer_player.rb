require './player'
class ComputerPlayer < Player

  def initialize
    @name = "HAL 9000"
    @grid = Grid.new
    @ships = []
  end

  def place_ships(ship_sizes)
    ship_sizes.each {|size| @ships << Ship.new(size)}


    @ships.each do |ship|

      #@grid.place_ship(ship, @grid.x_of(position), @grid.y_of(position), across)
    end
    puts "#{@name} has placed its ships."
  end

  def call_shot
    "#{("A".."J").to_a.sample} #{rand(1..10)}"
  end
end
