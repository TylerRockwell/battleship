# Battleship

## Description

This is a game of Battleship. There are two players. Each player places 5 ships on their board. Then, players take turns firing at each other's boards, resulting in a HIT or a MISS. Once a player has sunk all of the other player's ships, he or she has won. HAVE FUN!

## New features and bug fixes

* Local multiplayer!
* Now clears the screen between player turns
* Displays ships on the grid as they're placed
* When placing ships, any input other than across no longer defaults to down.
* Game now reports duplicated shots.


## Objective

Sink all 5 of your opponent's ships.

## Rules for placing ships

* Place each ship across or down
* Do not place a ship on spots that overlap with another ship.

## Instructions on how to play

* Before the game starts, each player will place their ships. [See above for rules for placing ships.]
* On your turn, pick a target coordinate and submit its location by letter and number. For example, you could enter B5 or E10.
* When you submit a coordinate, the game will tell you if you have a hit or a miss. A hit means that you have successfully hit an opponent's ship - while a miss means you have not.
* When it is your turn, you will see two grids - the first is a grid representing all of your hits and misses. A hit is a "+" and a miss is a "-". The second shows the location and status of your own boats. "O" signifies an occupied spot, while "X" signifies a spot that is occupied and has been HIT.
* You cannot fire and hit the same spot more than once.
* Once you have hit all the coordinates of a ship, that ship is sunk.
* Once you have sunk all of your opponent's ships, you have won the game.

## Known Issues

* If you place your ship outside of the bounds, the game will tell you that it overlaps another ship.
* Scrolling up allows you to see the other player's board.
* Computer player does not place ships
* Game crashes if given improperly formatted coordinates.
