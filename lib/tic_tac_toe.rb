WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(array, index, current_player)
array[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (index.between?(0,8)) && position_taken?(board,index) == false
    true
  else nil
end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |element|
  if (element == "X") || (element == "O")
    counter += 1
end
end
return counter
end

def current_player(board)
  if turn_count(board).even? == true
    return "X"
  else
    return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
      combo
    end
  end
end

def full?(board)
  if (!board.any?{|position| position == " "})
    return true
  else
    return false
end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    return false
end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board)
    `Congratulations ${winner(board)}!`
  elsif draw?(board)
    puts "Cat's Game!"
end
end

display_board(board)
play(board)
