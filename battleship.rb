require './human_player'
require './computer_player'
require './ship'
require './grid'
require './position'
require './game'

human1 = HumanPlayer.new("Amy")
human2 = HumanPlayer.new("Beth")
game = Game.new(human1, human2)

game.play
