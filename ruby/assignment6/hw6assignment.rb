# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  # your enhancements here
  def self.my_next_piece (board)
    Piece.new(All_My_Pieces.sample, board)
  end

  def self.cheat_piece (board)
    Piece.new([[[0, 0]]], board)
  end

  All_My_Pieces = All_Pieces +
  [rotations([[0, 0], [1, 0], [0, 1], [1, 1], [2, 1]]),
    [[[0, 0], [-1, 0], [1, 0], [2, 0], [3, 0]], [[0, 0], [0, -1], [0, 1], [0, 2], [0, 3]]],
    rotations([[0,0], [0, 1], [1, 1]])]

end

class MyBoard < Board
  # your enhancements here
 def initialize (game)
  super(game)
  @current_block = MyPiece.my_next_piece(self)
 end

   # gets the next piece
  def next_piece
    @current_block = @force_next_piece || MyPiece.my_next_piece(self)
    @force_next_piece = nil
    @current_pos = nil
  end

  def cheat_once
    unless @force_next_piece
      if self.score >= 100
        @score -= 100
        @force_next_piece = MyPiece.cheat_piece(self)
      end
    end
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    locations.each_with_index do |current, index| 
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    end
    remove_filled
    @delay = [@delay - 2, 80].max
  end

  def invert
   if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end
end

class MyTetris < Tetris
  # your enhancements here
 def initialize
  super
  my_key_bindings  
 end

 def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def my_key_bindings  
    @root.bind('u', proc {@board.invert}) 
    @root.bind('c', proc {@board.cheat_once})
  end
end