require './player'

def get_user_input
  gets.chomp
end

class HumanPlayer < Player

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(ship_sizes)
    ship_sizes.each {|size| @ships << Ship.new(size)}


    @ships.each do |ship|
      puts "#{@name}, where would you like to place a ship of length #{ship.length}?"
      position = get_user_input
      position.upcase!
      puts "Across or Down?"
      across = get_user_input
      across.downcase!
      if across == "across"
        across = true
      elsif across == "down"
        across = false
      else
        puts "Invalid placement. Please try again"
        redo
      end
      #across == "across" ? (across = true) : (across = false)

      unless @grid.place_ship(ship, @grid.x_of(position), @grid.y_of(position), across)
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
        redo
      end
      @grid.display_boat_grid
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):"
    get_user_input
  end
end
