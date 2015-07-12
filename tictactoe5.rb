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

#make sure player cannot choose filled square
def player_choice(b)
  begin
    puts "\n\nChoose an empty position (from 1 to 9) to place a piece:\n\n"
    playerchoice = gets.chomp.to_i
  end until board_available(b).include?(playerchoice)
  b[playerchoice] = "X"
end


def computer_choice(b)
  available = board_available(b)
  computerchoice = available.sample
  b[computerchoice] = "0"
end

#check if there is a winner
def winner_check(b)
  # player = "player"
  # computer = "computer"
  win_trio = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  win_player = b.select   { |k, val| val == "X"}.keys 
  win_computer = b.select { |k, val| val == "0"}.keys
  win_trio.each do |trio|
    return "Player" if b.values_at(*trio).count('X') == 3
    return "Computer" if b.values_at(*trio).count('O') == 3
  end
  nil
end

#get array of empty key positions on board
def board_available(b)
   b.select { |k, val| val == " "}.keys
end

def board_filled?(b)
  board_available(b) == []
end

#print game winner
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
    filled =  board_filled?(b)
  end until winner  || filled
  if winner
    display_winner(winner)
  elsif filled
    winner = "No One"
    display_winner(winner)
  end
