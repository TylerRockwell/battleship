require './position'
class Grid

  def initialize()
    #Creates new array with 100 Position objects
    @locations = Array.new(100)
      (1..100).each do |i|
        @locations[i] = Position.new
      end
  end

  def get_position(x, y)
    #Converts x,y coordinates to corresponding array index
    x + (y-1) * 10
  end

  def has_ship_on?(x, y)
    #Checks if position is occupied
    @locations[get_position(x,y)].occupied
  end

  def place_ship (ship, x, y, across)
    #Checks if spaces are occupied
    if across
      (x..x+ship.length-1).each do |i|
        return false if has_ship_on?(i, y)
      end
    else
      (y..y+ship.length-1).each do |i|
        return false if has_ship_on?(x, i)
      end
    end
    #Places ship horizontally or vertically
      ship.place(x, y, across)
      ship.positions.each do |coordinates|
        @locations[get_position(coordinates[0], coordinates[1])].occupied = true
      end
      # if across
      #   (x..x+ship.length-1).each {|i| @locations[get_position(i, y)].occupied = true}
      # else
      #   (y..y+ship.length-1).each { |i| @locations[get_position(x, i)].occupied = true}
      # end
  end

  def fire_at(x, y)
    #Checks if location has been fired at previously
    if (1..10).include?(x) && (1..10).include?(y)
      if @locations[get_position(x,y)].fired_upon
        #Automatic miss
        return false
      else
        #Marks location as being fired upon and checks for a hit
        @locations[get_position(x,y)].fired_upon = true
        has_ship_on?(x,y)
      end
    else
      false
    end
  end

  def sunk?()
    grid_occupied = false
    (1..100).each do |i|
      if @locations[i].occupied
        @locations[i].fired_upon ? () : (return false)
        grid_occupied = true
      end
    end
    grid_occupied
  end

  def x_of(grid_spot)
    grid_spot[1..-1].to_i
  end

  def y_of(grid_spot)
    reference = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10}
    reference[grid_spot[0].to_sym]
  end

  def display()
    #Outputs game grid to the user
    y = 1
    print "    1"
    (2..10).each {|i| print "   #{i}" }
    puts
    puts "  -----------------------------------------"
    ("A".."J").each do |letter|
      print "#{letter} |"
      (1..10).each do |x|
      #has_ship_on?(x,y) ? (@locations[get_position(x,y)].fired_upon ? (print " X |") : (print " O |")) : (print "   |") #Just for you, Mason!
        if has_ship_on?(x,y)
          @locations[get_position(x,y)].fired_upon ? (print " X |") : (print " O |")
        else
          (print "   |")
        end
      end
      puts
      y += 1
    end
    puts "  -----------------------------------------"
  end


end
