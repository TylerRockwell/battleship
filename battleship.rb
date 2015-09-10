require './human_player'
require './computer_player'
require './ship'
require './grid'
require './position'
require './game'

grid = Grid.new

grid.place_ship(Ship.new(3),4,5,true)
grid.place_ship(Ship.new(4),1,1,false)

grid.display
