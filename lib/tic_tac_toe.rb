class TicTacToe
  def initialize
    @board = Array.new(9, ' ')
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    index
  end

  def move(index, value = 'X')
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == 'X' || @board[index] == 'O'
      true
    elsif @board[index] == ' ' || @board[index] == '' || @board[index].nil?
      false
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    puts 'Please enter 1-9:'
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      value = current_player ##
      move(index, value)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      counter += 1 if turn == 'X' || turn == 'O'
    end
    counter
  end

  def current_player
    if turn_count.even?
      'X'
    else
      'O'
    end
  end

  def won?
    winner = false
    for win in WIN_COMBINATIONS
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]

      pos_1 = @board[win_index_1]
      pos_2 = @board[win_index_2]
      pos_3 = @board[win_index_3]

      if (pos_1 == 'X' && pos_2 == 'X' && pos_3 == 'X') || (pos_1 == 'O' && pos_2 == 'O' && pos_3 == 'O')
        return win
      else
        false
      end
    end
    winner
  end

  def full?
    @board.all? do |place|
      true if place == 'X' || place == 'O'
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    last1 = won?
    @board[last1[-1]] if last1
  end

  def play
    until over?
      turn
      won?
      draw?
    end
    winning_player = winner
    if winning_player
      puts "Congratulations #{winning_player}!"
    else
      puts "Cat's Game!"
    end
  end
end
