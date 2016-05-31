class SudokuBoard
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def create
    index_the_board
    convert_puzzle_string_to_puzzle_array
    populate_board_with_puzzle_array
  end


  private

  def index_the_board
    @index_array = []
    (0..8).each do |row|
      (0..8).each do |row_index|
        @index_array << [row, row_index]
      end
    end
  end

  def convert_puzzle_string_to_puzzle_array
    @puzzle_array = @puzzle_string.gsub(/[^0-9a-z]/i, ' ').split
  end

  def populate_board_with_puzzle_array
    sudoku_board = {}
    @index_array.each_with_index do |n, i|
      sudoku_board[n] = @puzzle_array[i]
    end

    sudoku_board
  end
end
