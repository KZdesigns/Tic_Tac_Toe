# HumanPlayer
# The HumanPlayer class is responsible for holding information about the user and prompting them to enter a position for gameplay.


class Human_Player

    attr_reader :mark 

    # HumanPlayer#initialize(mark_value)
    # We'll allow a player to use any mark they like, so an instance of HumanPlayer should have a instance variable to store their mark. 
    # The value of this mark should be provided as an argument when creating a new player. Consider adding a getter method for the player's 
    # mark, this may be useful later!

    def initialize(mark_value)
        @mark = mark_value
    end

    # HumanPlayer#get_position
    # This method should prompt and allow the user to enter a valid row col position. 
    # We recommend that you ask the user to enter the position as two numbers with a space between them. 
    # Your method should return their entered position as an array of the form [row, col] so that it is 
    # compatible with the design of our previous Board methods. For usability, raise an error when they 
    # fail to enter a position in the specified format, such as if they only enter a single number, use letters, or have too many spaces.

    # No need to verify if the position they entered is a valid position in this class. 
    # That validation requires knowledge of the board and we want to keep our concerns separated.
    # Besides, you previously implemented that logic in Board#valid? and Board#empty?.

    # It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.

    def get_position
        puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(' ').map(&:to_i)
        raise 'sorry, that was invalid :(' if pos.length != 2
        pos
    end
end