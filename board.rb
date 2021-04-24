# The Board class is responsible for adding a player's marks, checking for winners, 
# and printing the game board. A board instance must have an attribute to represent the grid. 
# For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

class Board

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    # Board#valid?(position)
    # This method should return a boolean indicating whether or not the specified 
    # position is valid for the board, meaning the position is not "out of bounds."

    def valid?(position)
        row, col = position
        position.all? do |i|
            i < @grid.length && i >= 0
        end
    end

    # Board#empty?(position)
    # This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

    def empty?(position)
        self[position] == "_"
    end

    # Board#place_mark(position, mark)
    # This method should assign the given mark to the specified position of the grid. 
    # It should raise an error when the position is not #valid? or not #empty?.

    def place_mark(position, mark)
        raise "invalid mark" if !valid?(position) || !empty?(position)
        self[position] = mark
    end

    # Board#print
    # This method should simply print out the board and all of the marks that have been placed on it. 
    # Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. 
    # This will help us visualize the board better as we debug or even play the game!

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    # Board#win_row?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    # Board#win_col?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end


    # Board#win_diagonal?(mark)
    # This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

    def win_diagonal?(mark)
        left = []
        right = []

        (0...@grid.length).each do |i|
            left << @grid[i][i]
            right << @grid[i][-i - 1]
        end

        left.uniq == [mark] && left.uniq.length == 1 || right.uniq == [mark] && right.uniq.length == 1
    end


    # Board#win?(mark)
    # This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    # Board#empty_positions?
    # This method should return a boolean indicating whether or not there is at least one empty position on the grid.

    def empty_positions?
        @grid.any? { |row| row.any?("_") }
    end  

    def legal_positions
        indices = (0...@grid.length).to_a
        positions = indices.product(indices)
        positions.select { |pos| empty?(pos) }
    end
end
