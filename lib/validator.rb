class Validator

  def self.validate(puzzle_string)
    @board = SudokuBoard.new(puzzle_string).create
    if valid_columns? && valid_rows? && valid_subgroups?
      message = "This sudoku is valid."
        if puzzle_incomplete?
          message = "This sudoku is valid, but incomplete." 
        end
    else
      message = "This sudoku is invalid."
    end
    message
  end

  def self.valid_columns?
    (0..8).each do |n|
      column_vals = []
        @board.each do |k,v|
          column_vals << v.to_i if k[1] == n
        end
      column_vals.delete(0)
      if any_duplicates?(column_vals)
        return false
      end
    end
    true
  end

  def self.valid_rows?
    (0..8).each do |n|
      row_vals = []
        @board.each do |k,v|
          row_vals << v.to_i if k[0] == n
        end
      row_vals.delete(0)
      if any_duplicates?(row_vals)
        return false
      end
    end
    true
  end

  def self.valid_subgroups?
    if top_left_quad_check &&
        top_center_quad_check &&
        top_right_quad_check &&
        mid_left_quad_check &&
        mid_center_quad_check &&
        mid_right_quad_check &&
        bottom_left_quad_check &&
        bottom_center_quad_check &&
        bottom_right_quad_check
      true
    else
      false
    end
  end

  def self.puzzle_incomplete?
    @board.each do |k,v|
      if v == "0"
        return true
      end
    end
    false
  end

  private

  def self.any_duplicates?(arr_to_check)
    arr_to_check.uniq.length != arr_to_check.length ? true : false
  end

  def self.top_left_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] <= 2 && point[0][1] <= 2
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.top_center_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] <= 2 && point[0][1].between?(3,5)
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.top_right_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] <= 2 && point[0][1] >= 6
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.mid_left_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0].between?(3,5) && point[0][1] <= 2
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.mid_center_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0].between?(3,5) && point[0][1].between?(3,5)
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.mid_right_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0].between?(3,5) && point[0][1] >= 6
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.bottom_left_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] >= 6 && point[0][1] <= 2
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.bottom_center_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] >= 6 && point[0][1].between?(3,5)
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end

  def self.bottom_right_quad_check
    quadrant_vals = []
    @board.each do |point|
      if point[0][0] >= 6 && point[0][1] >= 6
        quadrant_vals << point[1].to_i
      end
    end
    quadrant_vals.delete(0)
    any_duplicates?(quadrant_vals) ? false : true
  end
end
