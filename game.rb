class Game

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def welcome
    puts "Welcome, #{@human.name} and #{@computer.name}!"
    puts "It's time to play Battleship.\n"
  end

  def place_ships
    @human.place_ships([2,3,3,4,5])
    @computer.place_ships([2,3,3,4,5])
  end

  def display_status

  end
end
