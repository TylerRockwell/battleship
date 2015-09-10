class Game
  def get_user_input
    gets.chomp
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1_turn = true
  end

  def welcome
    puts "Welcome, #{@player1.name} and #{@player2.name}!"
    puts "It's time to play Battleship.\n"
  end

  def place_ships
    display_status
    @player1.place_ships([2,3,3,4,5])
    puts `clear`
    @p1_turn = !@p1_turn
    display_status
    @player2.place_ships([2,3,3,4,5])
    puts `clear`
    @p1_turn = !@p1_turn
  end

  def display_status
    if @p1_turn
      puts "SHOTS TAKEN:"
      @player2.grid.display_shots_grid
      puts
      puts "YOUR BOARD:"
      @player1.grid.display_boat_grid
    else
      puts "SHOTS TAKEN:"
      @player1.grid.display_shots_grid
      puts
      puts "YOUR BOARD:"
      @player2.grid.display_boat_grid
    end
  end

  def clear_screen
    puts "Press enter to end your turn. This will clear the screen."
    get_user_input
    puts `clear`
  end

  def validate_coordinates (coordinates)
    /\A[a-j]([1-9]|10)\z/i.match(coordinates)
  end

  def take_turn
    if @p1_turn
      target = @player1.call_shot
      if validate_coordinates
        x = @player2.grid.x_of(target)
        y = @player2.grid.y_of(target)
        @player2.grid.fire_at(x, y) ? (puts "Hit!") : (puts "Miss!")
      else
        puts "Invalid coordinates."
      end
    else
      target = @player2.call_shot
      if validate_coordinates
        x = @player1.grid.x_of(target)
        y = @player1.grid.y_of(target)
        @player1.grid.fire_at(x, y) ? (puts "Hit!") : (puts "Miss!")
      else
        puts "Invalid coordinates."
      end
    end
    @p1_turn = !@p1_turn
  end

  def play
    welcome
    place_ships
    puts "#{@player1.name}, press enter to begin."
    get_user_input
    until @player1.grid.sunk? || @player2.grid.sunk? do
      display_status
      take_turn
      clear_screen
    end

    @player1.grid.sunk? ? (puts "Congratulations, #{@player2.name}!") : (puts "Congratulations, #{@player1.name}!")
  end

end
