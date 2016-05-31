class Validator

  def self.validate(puzzle_string)
    @board = SudokuBoard.new(puzzle_string).create

    if valid_columns? && valid_rows? && valid_subgroups?
      return "This sudoku is valid."
    end
  end

  def valid_columns?

  end

  def valid_columns?

  end

  def valid_subgroups?

  end
end
