class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!"
    puts "It's time to play Battleship.\n"
  end

  def place_ships
    @player1.place_ships([2,3,3,4,5])
    @player2.place_ships([2,3,3,4,5])
  end

  def display_status
    puts "SHOTS TAKEN:"
    @player1.grid.display_shots_grid
    puts
    puts "YOUR BOARD:"
    @player1.grid.display_boat_grid
  end
end
