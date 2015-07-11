
#initialize board
# Draw board with 9 positions 
# Choose a position (from 1 to 9) to place a piece:
# Player chooses 1 position  as 'X'
# computer chooses 1 position from remaining spaces as '0' 
# Repeat until there is a winner or all spaces filled.

# Player won! Computer won! No one won!
# implement simple AI two_in_a_row
require 'pry'

b = {}

def create_board(b)
  (1..9).each {|key| b[key] = " "}
   b
end

def display_board(b)
  puts ""
  puts "#{b[1]}| #{b[2]}| #{b[3]}"
  puts "-------"
  puts "#{b[4]}| #{b[5]}| #{b[6]}"
  puts "-------"
  puts "#{b[7]}| #{b[8]}| #{b[9]}"
end

def player_choice(b)
  puts "\n\nChoose an empty position (from 1 to 9) to place a piece:\n\n"
  playerchoice = gets.chomp
  b[playerchoice.to_i] = "X"
end

def computer_choice(b)
  empty = b.select { |k, val| val == " "}
  computerchoice = empty.keys.sample
  b[computerchoice.to_i] = "0"
end

def winner_check(b)
  player = "Player"
  computer = "Computer"
  noone = "No one"
  win_trio = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  playerx = b.select   { |k, val| val == "X"} 
  computer0 = b.select { |k, val| val == "0"}
  win_rowplayer = playerx.keys 
  win_rowcomputer = computer0.keys
  if win_trio.include?(win_rowplayer)
    player
  elsif
    win_trio.include?(win_rowcomputer)
    computer
  else
    noone
  end
end

def board_filled(b)
  empty = b.select { |k, val| val == " "}
  empty.length == 0
end

def display_winner(winner)
    puts "#{winner} won this round!"

end 

create_board(b)
display_board(b)

begin
  player_choice(b)
  computer_choice(b)
  display_board(b)
  winner = winner_check(b)
end until winner  || board_filled?(b)

if winner
  display_winner(winner)
end